# Validation Guide

This guide helps you verify that the GitLab Pages setup is working correctly.

## Local Validation

If you have Typst 0.14 or later installed locally, you can test the compilation:

```bash
# Test compilation to HTML
typst compile --features html typst/main.typ index.html

# Verify the output was created
ls -lh index.html

# Open the HTML file in a browser
# On Linux: xdg-open index.html
# On macOS: open index.html
# On Windows: start index.html
```

## Expected Output

When the compilation is successful, you should see:

1. An `index.html` file created in the root directory
2. The HTML file should contain the rendered content from `typst/main.typ`
3. The document title should be "Feed" by "Brad Martin"

## Testing the Example Document

To test the example document:

```bash
typst compile --features html typst/examples/simple.typ example.html
```

## GitLab CI/CD Validation

After pushing to GitLab:

1. Go to your GitLab repository
2. Navigate to CI/CD → Pipelines
3. Check that the pipeline is running or has completed successfully
4. For the `pages` job (main branch only), verify:
   - The job status is "passed"
   - The artifacts include a `public/` directory
   - The `public/index.html` file exists

5. After successful deployment, visit your GitLab Pages URL:
   - Typically: `https://<username>.gitlab.io/<repository-name>/`
   - Or check Settings → Pages for the exact URL

## Troubleshooting

### Issue: Compilation fails with "unknown flag: --features"

**Solution**: Ensure you're using Typst 0.14 or later. The `--features html` flag was introduced in version 0.14.

```bash
typst --version  # Should show 0.14.0 or higher
```

### Issue: GitLab CI job fails

**Solution**: Check the following:
1. The Docker image in `.gitlab-ci.yml` is `ghcr.io/typst/typst:0.14.0`
2. All Typst files are syntactically correct
3. Template imports are using correct relative paths

### Issue: Page not found on GitLab Pages URL

**Solution**: 
1. Ensure the pipeline ran successfully on the main/master branch
2. Check that Pages are enabled in your repository settings
3. Wait a few minutes for Pages to deploy after the pipeline completes
4. Verify the artifact contains `public/index.html`

## File Structure Checklist

Verify your repository has the following structure:

```
✓ .gitignore              - Excludes build artifacts
✓ .gitlab-ci.yml          - CI/CD configuration
✓ README.md               - Documentation
✓ typst/
  ✓ main.typ              - Main document
  ✓ templates/
    ✓ base.typ            - Base template
  ✓ examples/
    ✓ simple.typ          - Example document
```

## Next Steps

Once validation is complete:

1. Customize `typst/main.typ` with your content
2. Modify `typst/templates/base.typ` to adjust styling
3. Add more templates as needed
4. Create additional content files in the `typst/` directory

## Resources

- [Typst Documentation](https://typst.app/docs)
- [Typst 0.14 Release Notes](https://github.com/typst/typst/releases/tag/v0.14.0)
- [GitLab Pages Documentation](https://docs.gitlab.com/ee/user/project/pages/)
