import { Elysia } from 'elysia'
import { PrismaClient } from '@prisma/client'
import cors from '@elysiajs/cors'

const prisma = new PrismaClient()
const app = new Elysia().use(cors())

// Flat
app.get('/folders', async () => prisma.folder.findMany({ include: { children: true, files: true } }))
app.get('/folders/:id', async ({ params }) =>
  prisma.folder.findMany({ where: { parent_id: Number(params.id) }, include: { children: true, files: true } })
)

// Nested
app.get('/folders/nested', async () => {
  const all = await prisma.folder.findMany({ include: { children: true, files: true } })
  const map = new Map<number, any>()
  const roots: any[] = []

  all.forEach(f => map.set(f.id, { ...f, children: [], files: f.files }))
  all.forEach(f => {
    const node = map.get(f.id)!
    if (f.parent_id === null) roots.push(node)
    else {
      const parent = map.get(f.parent_id)
      if (parent) parent.children.push(node)
      else roots.push(node)
    }
  })

  return roots
})

app.listen(3000)
console.log('✅ Backend jalan di http://localhost:3000')
