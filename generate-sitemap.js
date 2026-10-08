const fs = require('fs');
const path = require('path');

const DOMAIN = 'https://nextstepdigital.shop';
const DIR = './';

function getHtmlFiles(dir, fileList = []) {
    const files = fs.readdirSync(dir);
    files.forEach(file => {
        const filePath = path.join(dir, file);
        if (fs.statSync(filePath).isDirectory()) {
            if (!['node_modules', '.git', 'images', 'css', '.github', 'assets', 'src'].includes(file)) {
                getHtmlFiles(filePath, fileList);
            }
        } else if (file.endsWith('.html')) {
            fileList.push(filePath);
        }
    });
    return fileList;
}

const files = getHtmlFiles(DIR);
const urls = files.map(file => {
    let relPath = file.replace(/\\/g, '/').replace('./', '');
    if (relPath === 'index.html') relPath = '';
    return `  <url>\n    <loc>${DOMAIN}/${relPath}</loc>\n    <changefreq>weekly</changefreq>\n  </url>`;
});

const sitemapContent = `<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n${urls.join('\n')}\n</urlset>`;

fs.writeFileSync('sitemap.xml', sitemapContent);
console.log('Sitemap generata con successo!');