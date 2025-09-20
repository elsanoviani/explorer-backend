import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

async function main() {
  // Root folder
  const root = await prisma.folder.create({ data: { name: 'Projects' } })

  // Nested folders
  const web = await prisma.folder.create({ data: { name: 'Website', parent_id: root.id } })
  const docs = await prisma.folder.create({ data: { name: 'Docs', parent_id: root.id } })
  const api = await prisma.folder.create({ data: { name: 'API', parent_id: web.id } })

  // Files
  await prisma.file.createMany({
    data: [
      { name: 'README.md', type: 'text', folder_id: root.id },
      { name: 'index.html', type: 'html', folder_id: web.id },
      { name: 'style.css', type: 'css', folder_id: web.id },
      { name: 'guide.pdf', type: 'pdf', folder_id: docs.id },
      { name: 'api-docs.md', type: 'md', folder_id: api.id }
    ]
  })
}

main()
  .catch(e => console.error(e))
  .finally(async () => { await prisma.$disconnect() })
