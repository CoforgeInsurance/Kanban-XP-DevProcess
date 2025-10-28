# Issue Management Strategy for Ancient Wisdom API

## Overview

This repository implements a **dependency-driven, auto-assignment workflow** for GitHub Copilot. Issues are created upfront but only assigned to Copilot when their prerequisite issues are complete.

## Strategy

### 1. **Create All Issues Upfront** ✅
- Define complete feature set (77 issues total)
- Document dependencies clearly
- Provide comprehensive BDD scenarios for each issue
- Include technical implementation hints

### 2. **Organize into Dependency Chains** 🔗
- **Phase 1 (Foundation)**: Solution structure + Content data (parallel)
- **Phase 2 (Domain)**: Domain entities → Interfaces → Value objects
- **Phase 3 (Data)**: EF Core configs → Migrations → Repositories → Seed data
- **Phase 4 (Application)**: DTOs → Services (parallel after DTOs ready)
- **Phase 5 (API)**: Controllers (parallel after services ready)
- **Phase 6 (Advanced)**: Caching, search, analytics
- **Phase 7 (Testing)**: Unit, integration, BDD tests
- **Phase 8 (Frontend)**: Static website (HTML/CSS/JS)
- **Phase 9 (Deployment)**: Docker, Azure, CI/CD

### 3. **Automatic Copilot Assignment** 🤖

The `.github/workflows/auto-assign-copilot.yml` workflow:

**Triggers:**
- When a PR is merged
- Manual workflow dispatch

**Logic:**
1. Detects which issue was completed (from merged PR)
2. Checks dependency map for issues waiting on that blocker
3. If all blockers for an issue are complete → auto-assigns to Copilot
4. Posts comment explaining why issue was auto-assigned
5. Updates dependency status report

**Example Flow:**
```
PR #8 merges (completes Issue #7) 
  → Workflow detects Issue #7 complete
  → Checks: Issue #17 depends on #7
  → All blockers complete for #17
  → Auto-assigns Issue #17 to Copilot
  → Copilot starts working on Domain Entities
```

## Issue Categories

### 🟢 **No Dependencies (Assign Immediately)**

**Content Generation (Parallel-Safe):**
- #13 - Stoic Quotes ✅ Assigned
- #14 - Vedanta Quotes ✅ Assigned  
- #15 - Philosopher Bios ✅ Assigned
- #16 - Timeline Events ✅ Assigned
- #17 - Cynicism Quotes (just created, ready to assign)
- #74 - Epicureanism Quotes (to create)
- #75 - Buddhism Quotes (to create)
- #76 - Taoism Quotes (to create)
- #77 - Sufism Quotes (to create)

**Infrastructure:**
- #7 - Solution Structure ✅ Assigned

### 🟡 **With Dependencies (Auto-Assign After Blockers)**

**Phase 2 - Domain Layer:**
- #17 - Domain Entities ← Blocked by #7
- #18 - Domain Interfaces ← Blocked by #17
- #19 - Value Objects & Enums ← Blocked by #17

**Phase 3 - Data Layer:**
- #20 - EF Core Configurations ← Blocked by #17
- #21 - Database Migrations ← Blocked by #20
- #22 - Repository Pattern ← Blocked by #20
- #23 - Seed Data (Traditions) ← Blocked by #21, #13, #14
- #24 - Seed Data (Philosophers) ← Blocked by #21, #15
- #25 - Seed Data (Quotes) ← Blocked by #21, #13, #14
- #26 - Seed Data (Timeline) ← Blocked by #21, #16

**Phase 4 - Application Layer:**
- #27 - Application DTOs ← Blocked by #17
- #28 - AutoMapper Profiles ← Blocked by #27
- #29-#34 - Services (6 issues) ← Blocked by #22, #27

**Phase 5 - API Layer:**
- #35-#42 - API Endpoints (8 issues) ← Blocked by respective services

## Dependency Map

```
#7 (Solution Structure) ✅ In Progress
  ├─→ #17 (Domain Entities)
  │     ├─→ #18 (Domain Interfaces)
  │     ├─→ #19 (Value Objects)
  │     ├─→ #20 (EF Core Configs)
  │     │     ├─→ #21 (Migrations)
  │     │     │     ├─→ #23 (Seed Traditions) + #13, #14 ✅
  │     │     │     ├─→ #24 (Seed Philosophers) + #15 ✅
  │     │     │     ├─→ #25 (Seed Quotes) + #13, #14 ✅
  │     │     │     └─→ #26 (Seed Timeline) + #16 ✅
  │     │     └─→ #22 (Repositories)
  │     │           └─→ #29-34 (Services) + #27
  │     └─→ #27 (DTOs)
  │           ├─→ #28 (AutoMapper)
  │           └─→ #29-34 (Services) + #22
  └─→ #35-42 (API Endpoints) ← Blocked by respective services

#13 (Stoic Quotes) ✅ In Progress → #23, #25
#14 (Vedanta Quotes) ✅ In Progress → #23, #25
#15 (Philosopher Bios) ✅ In Progress → #24
#16 (Timeline Events) ✅ In Progress → #26
```

## Current Status

### ✅ **Active (5 issues assigned to Copilot)**
1. #7 - Solution Structure
2. #13 - Stoic Quotes (50+)
3. #14 - Vedanta Quotes (50+)
4. #15 - Philosopher Bios (27+)
5. #16 - Timeline Events (45+)

### 🟢 **Ready to Assign (no blockers)**
- #17 - Cynicism Quotes (42+)
- #74-77 - Other tradition quotes (to create)

### 🟡 **Waiting (67 issues)**
- Organized in 8 phases
- Will be auto-assigned as dependencies complete

## Timeline Projection

**Assumptions:**
- Copilot completes average issue in 1-3 days
- Content generation (5 parallel) → 3-5 days
- Sequential dependencies add time
- Human review between phases

**Estimated Duration:**
- **Phase 1** (Foundation): Week 1-2
- **Phase 2** (Domain): Week 2-3
- **Phase 3** (Data): Week 3-5
- **Phase 4** (Application): Week 5-7
- **Phase 5** (API): Week 7-9
- **Phase 6** (Advanced): Week 9-11
- **Phase 7** (Testing): Week 11-13
- **Phase 8** (Frontend): Week 13-16
- **Phase 9** (Deployment): Week 16-18

**Total Estimate: 18 weeks (4.5 months) for full application**

## Benefits of This Approach

### 1. **Maximizes Copilot Utilization** 🤖
- Auto-assignment keeps Copilot continuously working
- No manual intervention needed for routine assignments
- Human focuses on high-value review, not task management

### 2. **Maintains Quality** ✅
- Dependencies ensure correct build order
- Each phase reviewed before proceeding
- BDD scenarios ensure testable outcomes
- No "big bang" integration issues

### 3. **Visibility & Planning** 📊
- All work defined upfront (77 issues)
- Clear dependency chains
- Progress tracking automated
- Timeline predictability

### 4. **Parallel Execution Where Possible** ⚡
- Content generation runs in parallel (5+ issues)
- Services can run parallel after DTOs ready (6 issues)
- API endpoints can run parallel after services ready (8 issues)
- Tests can start alongside development

### 5. **Risk Mitigation** 🛡️
- Foundation established before building layers
- Database schema locked before seeding data
- API contracts defined before frontend
- Testing validates each phase

## Next Steps

### Immediate (Today)
1. ✅ Assign #17 (Cynicism Quotes) to Copilot
2. Create remaining content issues (#74-77)
3. Assign all content issues to Copilot (parallel execution)

### As #7 Completes (This Week)
1. Auto-assign #17 (Domain Entities)
2. Review domain model design
3. Provide feedback to Copilot if needed

### Phase 1 Complete (Week 2)
1. Review all content data quality
2. Review solution structure
3. Green-light Phase 2 (Domain Layer)

### Ongoing
1. Monitor auto-assignment workflow
2. Review PRs as Copilot creates them
3. Update dependency map if scope changes
4. Track velocity to refine timeline

## Human Review Checkpoints

**After Each Phase:**
- Review architecture decisions
- Validate code quality
- Check test coverage
- Approve before next phase auto-assigns

**Critical Reviews:**
- **After Phase 2**: Domain model design
- **After Phase 3**: Database schema
- **After Phase 5**: API contracts
- **After Phase 7**: UX/UI design
- **Before Phase 9**: Production readiness

## Monitoring & Metrics

Track these via GitHub Actions:
- Issues completed per week
- Average time from assignment to PR creation
- PR review cycle time
- Auto-assignment success rate
- Phase completion dates vs estimates

## Conclusion

This dependency-driven, auto-assignment strategy:
- **Scales** agent-first development to large projects
- **Maintains** code quality through phased reviews
- **Maximizes** parallel execution where safe
- **Minimizes** human task management overhead
- **Provides** clear visibility and predictability

**The result: A fully automated development pipeline with human oversight at strategic checkpoints.**

---

**See Also:**
- [ISSUE-DEPENDENCY-MAP.md](./.issue-templates/ISSUE-DEPENDENCY-MAP.md) - Complete 77-issue roadmap
- [AGENT_FIRST_PROCESS.md](./AGENT_FIRST_PROCESS.md) - Agent-first workflow guide
- [ARCHITECTURE.md](./ARCHITECTURE.md) - Technical architecture specification
