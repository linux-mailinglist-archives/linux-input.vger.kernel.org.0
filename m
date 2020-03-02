Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14E50175827
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 11:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgCBKSm (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 05:18:42 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:46850 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726654AbgCBKSm (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 05:18:42 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022AHPre029337;
        Mon, 2 Mar 2020 11:18:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=lVNZlW2TEVzdSx5uY5AV+8wsV6wkYAOCEPlhpaxFhqE=;
 b=MLjyrgYA4M86XIJV8V7CqZt4mKdphl5A8zC7n7GdYWWo/M8so1U+8ZgLWDXQzUc0MZav
 edN/c6ChqRYWX8ssrxtoN2DFg6W2YS7WEszimG4CYm8LHyfDKZxwZ+q3em7TeWZoyM4F
 M7Ut6WWdNQvzW3DUsVXy64iQgihAn41cbBc2DW36eKgEHOCX39fJCrCK13+S/6SrO98c
 6hT42Ffzs7eW/ZukXB1oCVRS73NiqT9W7yx7dIdIUDYSuxSjAgNW29boqB4EWcAIeDwH
 d2nnDfleC7Nv3w798YPN5tnc13vYQ7dIHb+z/RZHIAA4cH/FP8YJ9EAuhLyONf6uggp/ EQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yffqpjqat-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 11:18:35 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 3008C10003A;
        Mon,  2 Mar 2020 11:18:31 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 243CF2B62F5;
        Mon,  2 Mar 2020 11:18:31 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar 2020 11:18:30
 +0100
From:   Yannick Fertre <yannick.fertre@st.com>
To:     Bastien Nocera <hadess@hadess.net>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Benjamin Gaignard <benjamin.gaignard@st.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] Input: goodix - support gt9147 touchpanel
Date:   Mon, 2 Mar 2020 11:18:28 +0100
Message-ID: <1583144308-3781-3-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
References: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-02-28,2020-03-02 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support for it by adding compatible and supported chip data
(default settings used).
The chip data on GT9147 is similar to GT912, like
- config data register has 0x8047 address
- config data register max len is 240
- config data checksum has 8-bit

Signed-off-by: Yannick Fertre <yannick.fertre@st.com>
---
 drivers/input/touchscreen/goodix.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/input/touchscreen/goodix.c b/drivers/input/touchscreen/goodix.c
index 0403102..8851a35 100644
--- a/drivers/input/touchscreen/goodix.c
+++ b/drivers/input/touchscreen/goodix.c
@@ -251,6 +251,7 @@ static const struct goodix_chip_data *goodix_get_chip_data(u16 id)
 		return &gt911_chip_data;
 
 	case 912:
+	case 9147:
 	case 967:
 		return &gt967_chip_data;
 
@@ -1054,6 +1055,7 @@ static const struct of_device_id goodix_of_match[] = {
 	{ .compatible = "goodix,gt9271" },
 	{ .compatible = "goodix,gt928" },
 	{ .compatible = "goodix,gt967" },
+	{ .compatible = "goodix,gt9147",},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, goodix_of_match);
-- 
2.7.4

