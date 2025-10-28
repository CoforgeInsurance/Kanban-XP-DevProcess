# Issue Dependency Map for Ancient Wisdom API

This document tracks issue dependencies to ensure proper build order and Copilot assignment sequencing.

## Legend
- 🟢 **Ready to Assign** - No blockers, can be assigned to Copilot now
- 🟡 **Waiting** - Has dependencies, assign after prerequisites complete
- 🔵 **In Progress** - Currently assigned to Copilot
- ✅ **Complete** - PR merged

---

## Phase 1: Foundation (Sprint 1)

### Infrastructure Setup
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #7 - Solution Structure | 🔵 In Progress | None | ✅ Assigned |
| #13 - Stoic Quotes Data | 🔵 In Progress | None | ✅ Assigned |
| #14 - Vedanta Quotes Data | 🔵 In Progress | None | ✅ Assigned |
| #15 - Philosopher Bios Data | 🔵 In Progress | None | ✅ Assigned |
| #16 - Timeline Events Data | 🔵 In Progress | None | ✅ Assigned |

### Domain Layer (Depends on #7)
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #17 - Domain Entities | 🟡 Waiting | #7 | After solution structure merged |
| #18 - Domain Interfaces | 🟡 Waiting | #17 | After entities defined |
| #19 - Value Objects & Enums | 🟡 Waiting | #17 | After entities defined |

---

## Phase 2: Data Layer (Sprint 2)

### Infrastructure - Database
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #20 - EF Core Configurations | 🟡 Waiting | #17 | After entities complete |
| #21 - Database Migrations | 🟡 Waiting | #20 | After EF configs complete |
| #22 - Repository Pattern | 🟡 Waiting | #20 | After EF configs complete |
| #23 - Seed Data (Traditions) | 🟡 Waiting | #21, #13, #14 | After migrations + content data ready |
| #24 - Seed Data (Philosophers) | 🟡 Waiting | #21, #15 | After migrations + bio data ready |
| #25 - Seed Data (Quotes) | 🟡 Waiting | #21, #13, #14 | After migrations + quote data ready |
| #26 - Seed Data (Timeline) | 🟡 Waiting | #21, #16 | After migrations + timeline data ready |

---

## Phase 3: Application Layer (Sprint 3)

### Application Services & DTOs
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #27 - Application DTOs | 🟡 Waiting | #17 | After domain entities complete |
| #28 - AutoMapper Profiles | 🟡 Waiting | #27 | After DTOs defined |
| #29 - Tradition Service | 🟡 Waiting | #22, #27 | After repositories + DTOs ready |
| #30 - Philosopher Service | 🟡 Waiting | #22, #27 | After repositories + DTOs ready |
| #31 - Quote Service | 🟡 Waiting | #22, #27 | After repositories + DTOs ready |
| #32 - Theme Service | 🟡 Waiting | #22, #27 | After repositories + DTOs ready |
| #33 - Practice Service | 🟡 Waiting | #22, #27 | After repositories + DTOs ready |
| #34 - Timeline Service | 🟡 Waiting | #22, #27 | After repositories + DTOs ready |

---

## Phase 4: API Layer (Sprint 4)

### REST API Endpoints
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #35 - Traditions API Endpoints | 🟡 Waiting | #29 | After Tradition service ready |
| #36 - Philosophers API Endpoints | 🟡 Waiting | #30 | After Philosopher service ready |
| #37 - Quotes API Endpoints | 🟡 Waiting | #31 | After Quote service ready |
| #38 - Themes API Endpoints | 🟡 Waiting | #32 | After Theme service ready |
| #39 - Practices API Endpoints | 🟡 Waiting | #33 | After Practice service ready |
| #40 - Timeline API Endpoints | 🟡 Waiting | #34 | After Timeline service ready |
| #41 - Search API Endpoint | 🟡 Waiting | #31, #30, #29 | After core services ready |
| #42 - Daily Quote API Endpoint | 🟡 Waiting | #31 | After Quote service ready |

---

## Phase 5: Advanced Features (Sprint 5)

### Caching & Performance
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #43 - Redis Caching Layer | 🟡 Waiting | #35-#40 | After all API endpoints ready |
| #44 - Response Compression | 🟡 Waiting | #35-#40 | After all API endpoints ready |
| #45 - API Rate Limiting | 🟡 Waiting | #35-#40 | After all API endpoints ready |

### Search & Analytics
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #46 - Full-Text Search (Quotes) | 🟡 Waiting | #41 | After basic search ready |
| #47 - Comparison API (Traditions) | 🟡 Waiting | #35, #38 | After Traditions + Themes ready |
| #48 - Analytics Tracking | 🟡 Waiting | #35-#40 | After all API endpoints ready |

---

## Phase 6: Testing (Sprint 6)

### Comprehensive Test Coverage
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #49 - Domain Unit Tests | 🟡 Waiting | #17 | After entities complete |
| #50 - Application Unit Tests | 🟡 Waiting | #29-#34 | After services complete |
| #51 - API Integration Tests | 🟡 Waiting | #35-#40 | After endpoints complete |
| #52 - BDD Feature Tests (SpecFlow) | 🟡 Waiting | #35-#40 | After endpoints complete |
| #53 - Performance Tests | 🟡 Waiting | #43-#45 | After caching/optimization ready |

---

## Phase 7: Frontend (Sprint 7-8)

### Static Website (HTML/CSS/JS)
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #54 - Frontend Project Setup | 🟡 Waiting | #35-#40 | After API ready |
| #55 - Design System & Styles | 🟡 Waiting | #54 | After frontend setup |
| #56 - Homepage Layout | 🟡 Waiting | #55 | After design system ready |
| #57 - Browse Traditions Page | 🟡 Waiting | #35, #55 | After Traditions API + design ready |
| #58 - Browse Philosophers Page | 🟡 Waiting | #36, #55 | After Philosophers API + design ready |
| #59 - Quote of the Day Widget | 🟡 Waiting | #42, #55 | After Daily Quote API + design ready |
| #60 - Browse Quotes Page | 🟡 Waiting | #37, #55 | After Quotes API + design ready |
| #61 - Quote Detail/Share Page | 🟡 Waiting | #37, #55 | After Quotes API + design ready |
| #62 - Timeline Visualization | 🟡 Waiting | #40, #55 | After Timeline API + design ready |
| #63 - Search Interface | 🟡 Waiting | #41, #55 | After Search API + design ready |
| #64 - Comparison Tool UI | 🟡 Waiting | #47, #55 | After Comparison API + design ready |
| #65 - Practice Guide Pages | 🟡 Waiting | #39, #55 | After Practices API + design ready |

---

## Phase 8: Deployment (Sprint 9)

### Production Readiness
| Issue | Status | Depends On | Assign When |
|-------|--------|------------|-------------|
| #66 - Docker Containerization | 🟡 Waiting | #35-#40 | After API endpoints ready |
| #67 - Docker Compose (API + DB + Redis) | 🟡 Waiting | #66, #43 | After Docker + Redis ready |
| #68 - Azure Container Apps Config | 🟡 Waiting | #66 | After Docker ready |
| #69 - Azure SQL Database Setup | 🟡 Waiting | #21 | After migrations ready |
| #70 - Static Website Hosting (Azure) | 🟡 Waiting | #54-#65 | After frontend complete |
| #71 - CI/CD Pipeline (Azure DevOps) | 🟡 Waiting | #66 | After Docker ready |
| #72 - Monitoring & Logging (AppInsights) | 🟡 Waiting | #68 | After Azure deployment ready |

---

## Content Completion Tracking

### Philosophical Traditions (7 total)
| Tradition | Quotes Issue | Status | Bio Issue | Status | Timeline Issue | Status |
|-----------|-------------|--------|-----------|--------|----------------|--------|
| Stoicism | #13 | 🔵 In Progress | #15 | 🔵 In Progress | #16 | 🔵 In Progress |
| Vedanta | #14 | 🔵 In Progress | #15 | 🔵 In Progress | #16 | 🔵 In Progress |
| Cynicism | #73 | 🟢 Ready | #15 | 🔵 In Progress | #16 | 🔵 In Progress |
| Epicureanism | #74 | 🟢 Ready | #15 | 🔵 In Progress | #16 | 🔵 In Progress |
| Buddhism | #75 | 🟢 Ready | #15 | 🔵 In Progress | #16 | 🔵 In Progress |
| Taoism | #76 | 🟢 Ready | #15 | 🔵 In Progress | #16 | 🔵 In Progress |
| Sufism | #77 | 🟢 Ready | #15 | 🔵 In Progress | #16 | 🔵 In Progress |

---

## Assignment Strategy

### Immediate Assignment (No Dependencies)
- ✅ #7, #13, #14, #15, #16 (Already assigned)
- 🟢 #73-#77 (Content generation - can assign immediately)

### Auto-Assign After Prerequisites
1. **After #7 merges** → Assign #17 (Domain Entities)
2. **After #17 merges** → Assign #18, #19 (Domain Interfaces, Value Objects)
3. **After #17 merges** → Assign #20 (EF Core Configurations)
4. **After #20 merges** → Assign #21, #22 (Migrations, Repositories)
5. **After #21 + #13 + #14 merge** → Assign #23, #25 (Seed Data)
6. **After #21 + #15 merge** → Assign #24 (Seed Philosopher Data)
7. **After #21 + #16 merge** → Assign #26 (Seed Timeline Data)
8. **After #17 merges** → Assign #27 (DTOs)
9. **After #22 + #27 merge** → Assign #29-#34 (Services) in parallel
10. **After #29-#34 merge** → Assign #35-#40 (API Endpoints) in parallel

### Manual Review Points
- **After Phase 1** - Review domain model design
- **After Phase 2** - Review database schema
- **After Phase 4** - API contract review
- **After Phase 6** - Test coverage review
- **After Phase 7** - UX/UI review
- **Before Phase 8** - Pre-production readiness review

---

## Metrics to Track

- **Total Issues**: 77
- **In Progress**: 5 (#7, #13, #14, #15, #16)
- **Blocked**: 0
- **Ready to Assign**: 5 (#73-#77)
- **Waiting on Dependencies**: 67

**Estimated Timeline**: 9 sprints (18 weeks with 2-week sprints)

---

## Notes

- Issues marked 🟢 can be assigned immediately (no blockers)
- Issues marked 🟡 should wait for dependencies to complete
- Content generation issues (#13-#16, #73-#77) can all run in parallel
- Frontend work (#54-#65) can start once API is stable (after Phase 4)
- Review Architecture doc before creating issues for accuracy
