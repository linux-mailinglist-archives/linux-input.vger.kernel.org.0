Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4305DCB035
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 22:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728114AbfJCUfa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 16:35:30 -0400
Received: from mx5.ucr.edu ([138.23.62.67]:59815 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726669AbfJCUfa (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 16:35:30 -0400
X-Greylist: delayed 427 seconds by postgrey-1.27 at vger.kernel.org; Thu, 03 Oct 2019 16:35:30 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570134930; x=1601670930;
  h=mime-version:from:date:message-id:subject:to;
  bh=+ZiXmSF3Ml9gakGC2tXoYBkVH0KRO776IPr1LP/B8bs=;
  b=rlk0JN08JYqr/t6eC7gCXASaPz4GguvY8JwNtkoLUXD32+MzTfJrissu
   hZqxjrPd/Wku5Th2CtUKNrg6rXTopuFmvD4Xa0A6k+5/l6KrmcTgBxH4p
   TPFEAoWIkr18aak5MHB2i7XRXQomHJnx0a1fS2mrkNHA58NtcXZGaKKb4
   aBfhdZXWHS1xTlcZPAjzrckZD+khYIqP/vk/GeNcgZDLcIYVr4tP5comq
   oWMDCP0MDFD+m38V7O6IYHJIy6JWv13uQalobrNagMSh1O7ikJgacfMah
   di2rGeAb+/ceIYoO+WSH8Rb0dsgi6Bvv1P8lPTenV6vshqiSpUeZZzI62
   g==;
IronPort-SDR: kYAG8uRt4KDr6qENnXs+sv/xvjo8CEYchCiE23k++iwgQn4a1bse9mmSyUXKoF+06L8555myiE
 mnEE/LrO5LVqLmHonAKg6w5457PF0JVDeho04xpX3h7XipVbuGbe9hw8Lj8AmppaqzjM+qngLj
 WEH4ZfL++fYoYdw9N2o+uBkhS0i9LdczLxEgJ1CJfJucL+NTsgPoNrjAZGhcm0s4tZ+e2opfzq
 tuHOlqGRxj2h9tRmsXg6Hvt8gALZNujhlYWahPDaldhN2l/AVD5mJugorvZOGm/KlnZvxK+GOC
 14M=
IronPort-PHdr: =?us-ascii?q?9a23=3APZTBwBEUubtquCQbW5GnfZ1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7zosuwAkXT6L1XgUPTWs2DsrQY0rGQ7/CrADBfqb+681k6OKRWUB?=
 =?us-ascii?q?EEjchE1ycBO+WiTXPBEfjxciYhF95DXlI2t1uyMExSBdqsLwaK+i764jEdAA?=
 =?us-ascii?q?jwOhRoLerpBIHSk9631+ev8JHPfglEnjWwba58IRmsogjctcYajZZtJ6sz1x?=
 =?us-ascii?q?DEvmZGd+NKyG1yOFmdhQz85sC+/J5i9yRfpfcs/NNeXKv5Yqo1U6VWACwpPG?=
 =?us-ascii?q?4p6sLrswLDTRaU6XsHTmoWiBtIDBPb4xz8Q5z8rzH1tut52CmdIM32UbU5Ui?=
 =?us-ascii?q?ms4qt3VBPljjoMOiUn+2/LlMN/kKNboAqgpxNhxY7UfJqVP+d6cq/EYN8WWX?=
 =?us-ascii?q?ZNUsNXWidcAI2zcpEPAvIOMuhYoYfzpEYAowWiCgS3GOPj1iVFimPq0aEm0e?=
 =?us-ascii?q?ksFxzN0gw6H9IJtXTZtNf6NKYTUOC10anIyijIYPBW2Tjn6YjDbxcsoPGNXL?=
 =?us-ascii?q?Jwa8XRyFUjGx/Lg1iLtIzqIymV2v4TvGeG8uptTOSigHMkpQFpujWj2Nsgh4?=
 =?us-ascii?q?3Tio8Wyl3I7zh1zYc3KNGiSkN3fdipG4ZKuS6ALYt5WMYiTnltuCY917IJp4?=
 =?us-ascii?q?a2fDMPyJQ73x7fbOGHc5SQ7hLjSumRJTB4iWpgeL2lhhay9VGsyunyVsWpyV?=
 =?us-ascii?q?pKoChInsXWunAC0BzT7ceHSv9j8Uu7xTmP0AXT5vlFIUAyi6XbN4YszqAsmp?=
 =?us-ascii?q?cXq0jOHS/7lF/rgKKXdEgo4Oql5/j/brXjvJCcNot0ig/kMqQpn8yyGeQ5Mw?=
 =?us-ascii?q?kOX2eB+OSwyKHv8EPiTbVXkvI2iLPVv47HKsQGvqK5GRNa0p4/6xajCDeryN?=
 =?us-ascii?q?AYnXgBLFJYdxOLlonpO1fWIPDlEfeymEqskDh1yPDcJLHhAYvCLmLFkLj/eb?=
 =?us-ascii?q?Zx8UlcyBA8zYMX25UBBrQAPOjiHFP2rtvbDhgnGwOxyufjTt5608dWXWOJH7?=
 =?us-ascii?q?/cMaXKrEOg+O0iOa+PaZUTtTK7LOIqo7bFjXI/lk4ANZKu25RfPHujGfJpC0?=
 =?us-ascii?q?6CJ2fnmJEMHXpc+kIMTO37lVvKaD9aYT7mTaI99yw9EaqtFsHeTZrrjbCcin?=
 =?us-ascii?q?SVBJpTM1FHGFCRFj/ad4yFE6MdeiKbI5c5yRQZXqLnRoM8g0L9/DTmwqZqe7?=
 =?us-ascii?q?KHshYTsojugZ0sv7Xe?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HPAgDPWJZdh0anVdFmDoIQhBCETI5?=
 =?us-ascii?q?ehRcBlh2BewEIAQEBDi8BAYQ7A4JKIzYHDgIDCQEBBQEBAQEBBQQBAQIQAQE?=
 =?us-ascii?q?BCA0JCCmFQII6KQGDVRF8DwImAiQSAQUBIgE0gwCCCwWiV4EDPIsmgTKIZQE?=
 =?us-ascii?q?JDYFIEnoojA6CF4Nuc4dRglgEgTcBAQGVK5ZSAQYCghEUA4xRiEQbmUAtjX6?=
 =?us-ascii?q?ZSg8jgTYDgggzGiV/BmeBT08QFIFpjXFbJJINAQE?=
X-IPAS-Result: =?us-ascii?q?A2HPAgDPWJZdh0anVdFmDoIQhBCETI5ehRcBlh2BewEIA?=
 =?us-ascii?q?QEBDi8BAYQ7A4JKIzYHDgIDCQEBBQEBAQEBBQQBAQIQAQEBCA0JCCmFQII6K?=
 =?us-ascii?q?QGDVRF8DwImAiQSAQUBIgE0gwCCCwWiV4EDPIsmgTKIZQEJDYFIEnoojA6CF?=
 =?us-ascii?q?4Nuc4dRglgEgTcBAQGVK5ZSAQYCghEUA4xRiEQbmUAtjX6ZSg8jgTYDgggzG?=
 =?us-ascii?q?iV/BmeBT08QFIFpjXFbJJINAQE?=
X-IronPort-AV: E=Sophos;i="5.67,253,1566889200"; 
   d="scan'208";a="80488564"
Received: from mail-lf1-f70.google.com ([209.85.167.70])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Oct 2019 13:28:22 -0700
Received: by mail-lf1-f70.google.com with SMTP id x20so374354lfe.14
        for <linux-input@vger.kernel.org>; Thu, 03 Oct 2019 13:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=5hiDq5CRZQO24BjwK2Vj6BUgttdyVqPegwbF8dwqeIA=;
        b=Qo6FepewzkDEaCmgS1NPbh0KLV2Fta/quCndFi98KnP9VjyfIjPh77/LnyAQV9QNJ+
         +ZTeeR1RlRuKH8HGdp9lwlaPh5GEyg135u8CNTHcUWuCjpKfSNHouVOUEOPVSZS2Ow/J
         QG4s14smBAmrGJ4RdTcd9lNzrCaBghiuYrFIl3GtDLlaPAxaVKMvZJWj1CkEFSWni/nj
         5PzCCjAuN1XHaBcfBzSkp0etj8B2C0Q8g+bjtPQcQs4llmymG/YCwaNy34xjH6O6/CZ5
         ZtjfUqQtprvLFI5QpqZsJM5eYji4+R4EOx1zihe/Z5ZrfCXwX6LVzaaqk/HChEv28TqC
         UkVQ==
X-Gm-Message-State: APjAAAWNNv+TTO7fgGAEY2aB8ti8xbywwFZK9NBGtSM7VpRPjG3oDZwD
        zGyxhmJEu3ExJFn4gNx4zm/MgqHAAy0eGRiTCTUzIBVS4YaXZZ+JStzHLks0FR1VcQUul7rYvWw
        H+2T9/fWsx/HC0Z0zkI2M4iNRFRKnvsuIHJl5s3x/
X-Received: by 2002:a2e:9753:: with SMTP id f19mr7199050ljj.197.1570134501218;
        Thu, 03 Oct 2019 13:28:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOWaGdfxTpWyfkBpVEV32eCef2su//j434BNHtXRBkoZc6/22eUg0XB/mhDKx0tCDotoIC1Ls4fMGUhI0L494=
X-Received: by 2002:a2e:9753:: with SMTP id f19mr7199046ljj.197.1570134501024;
 Thu, 03 Oct 2019 13:28:21 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Thu, 3 Oct 2019 13:29:05 -0700
Message-ID: <CABvMjLR1FmKNWrvsFF1x24iv218+Px-HUfmRyt7CtqfhZxOgyA@mail.gmail.com>
Subject: Potential uninitialized variables in subsys input: bcm_iproc_tsc
To:     dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        Chengyu Song <csong@cs.ucr.edu>,
        Zhiyun Qian <zhiyunq@cs.ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Dmitry:

Variable "intr_status" and "raw_coordinate" in function
iproc_touchscreen_interrupt()(
(drivers/input/touchscreen/bcm_iproc_tsc.c) could be uninitialized if
regmap_read() returns -EINVAL. But it's directly used later without
the return check, which is potentially unsafe.

Also, we cannot simply return -EINVAL in iproc_touchscreen_interrupt()
because it is out of the return type: irqreturn_t. The same cases
happen in function  mx25_tcq_irq() with variable "stat" and function
mx25_tcq_init() with variable "tgcr".

Thanks for your time to check this case.
-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
