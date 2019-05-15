Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 443841F523
	for <lists+linux-input@lfdr.de>; Wed, 15 May 2019 15:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727455AbfEONMR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 15 May 2019 09:12:17 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:60880 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725977AbfEONMR (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 15 May 2019 09:12:17 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4FDBiB5004311;
        Wed, 15 May 2019 15:12:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=hsoagTcEmJBlum5Zj5KDBo7ERhzML01L3nfhfLigSUo=;
 b=G40l7JyrSWymwzpB5rECgcNxInszg90AWT5SP2l5Wl4F1V6dcnrMUwbBAfOwWVjPQmA2
 v7TQK1b4iUArK889X2XELYHapjDuKjiP3DcZjBhA0JfqHnpIlhxaDyWx2IkQY0kcF9S2
 7v8ZuJmNfjoyL6Vt38unKf0okgL5+U908M0LC+EEK4AAP9iicnLrz9EHzOo3+VDRGAkb
 4mqJM3X3eXN273oAkNI8M2pmNCEayMwl7RKhwQvsVKZQS/bLwcs2OVd8lNaqUZvB2Da0
 gmOdTdSe99L52jz/3dbt4kA8BJbsvd+Kxm5NMomvzcxhhi9UXYZdkqr5R4xIYMSDU+RD Sg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2sdn9g0yeq-1
        (version=TLSv1 cipher=ECDHE-RSA-AES256-SHA bits=256 verify=NOT);
        Wed, 15 May 2019 15:12:05 +0200
Received: from zeta.dmz-eu.st.com (zeta.dmz-eu.st.com [164.129.230.9])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id BB91638;
        Wed, 15 May 2019 13:12:03 +0000 (GMT)
Received: from Webmail-eu.st.com (Safex1hubcas21.st.com [10.75.90.44])
        by zeta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9EE0627F5;
        Wed, 15 May 2019 13:12:03 +0000 (GMT)
Received: from SAFEX1HUBCAS22.st.com (10.75.90.93) by SAFEX1HUBCAS21.st.com
 (10.75.90.44) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May
 2019 15:12:03 +0200
Received: from localhost (10.201.20.122) by Webmail-ga.st.com (10.75.90.48)
 with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 15 May 2019 15:12:03
 +0200
From:   Benjamin Gaignard <benjamin.gaignard@st.com>
To:     <rafael.j.wysocki@intel.com>, <dmitry.torokhov@gmail.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>, <hadess@hadess.net>,
        <frowand.list@gmail.com>, <m.felsch@pengutronix.de>,
        <agx@sigxcpu.org>, <arnd@arndb.de>
CC:     <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>, <broonie@kernel.org>,
        Benjamin Gaignard <benjamin.gaignard@st.com>
Subject: [PATCH v2 2/5] Input: edt-ft5x06: Document suspend-dependencies property
Date:   Wed, 15 May 2019 15:11:51 +0200
Message-ID: <20190515131154.18373-3-benjamin.gaignard@st.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20190515131154.18373-1-benjamin.gaignard@st.com>
References: <20190515131154.18373-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.201.20.122]
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-15_07:,,
 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Explain the purpose of suspend-dependencies property.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
---
 Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
index 870b8c5cce9b..81e8eb44d720 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
+++ b/Documentation/devicetree/bindings/input/touchscreen/edt-ft5x06.txt
@@ -60,6 +60,8 @@ Optional properties:
  - touchscreen-inverted-x  : See touchscreen.txt
  - touchscreen-inverted-y  : See touchscreen.txt
  - touchscreen-swapped-x-y : See touchscreen.txt
+ - suspend-dependencies	: Phandle list of devices which have to be suspended
+			  after touchscreen device and resumed before it.
 
 Example:
 	polytouch: edt-ft5x06@38 {
-- 
2.15.0

