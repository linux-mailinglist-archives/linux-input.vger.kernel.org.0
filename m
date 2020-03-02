Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACB4B175829
	for <lists+linux-input@lfdr.de>; Mon,  2 Mar 2020 11:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbgCBKSp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 2 Mar 2020 05:18:45 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:38490 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727386AbgCBKSn (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 2 Mar 2020 05:18:43 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022AHfjG004585;
        Mon, 2 Mar 2020 11:18:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : subject :
 date : message-id : mime-version : content-type; s=STMicroelectronics;
 bh=+puGmu9zlwbaFpGqLpx72PUlCRVhOg5intWmOG3EzJo=;
 b=tVz5UR0eB1Vd0bh8hUu0/qoHnPR5nrN7149Gvrz6EZX+LkWQ5gEN1DrJ2Q4+UAoioPZo
 64i6Qw6Z3ahX/M6P6SJBoP/2cST70WMNDHL1bnu+A2vbByqaTC+pzO6AfMVbRLbj0j/l
 E413PshJd8YPL55ee+q7xhXQPiYU4ETvP5Y2NZcWij+ZxPbMRdZtPeoWAHsnATDIHMYd
 QjCfDT7JrI+eZ4ed0G/XPx0rPDncsN3ORA97xy5lzFkHhp5tji1tFCEjqQxgpW3jQhoE
 4+Go3gw1uOXuccMeHYPCwVBQ/UGx3ypIylUjKn5kFNkcw0b8vMsnKi+n2XwSk+RY0gLb sw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfea6jv53-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 11:18:34 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3617100034;
        Mon,  2 Mar 2020 11:18:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B36D52B62F6;
        Mon,  2 Mar 2020 11:18:29 +0100 (CET)
Received: from localhost (10.75.127.44) by SFHDAG6NODE1.st.com (10.75.127.16)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Mar 2020 11:18:29
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
Subject: [PATCH v1 0/2] goodix: support of gt9147
Date:   Mon, 2 Mar 2020 11:18:26 +0100
Message-ID: <1583144308-3781-1-git-send-email-yannick.fertre@st.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG6NODE1.st.com
 (10.75.127.16)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-02-28,2020-03-02 signatures=0
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Add support of GT9147 for Goodix touchscreen.
The chip data on GT9147 is similar to GT912, like
- config data register has 0x8047 address
- config data register max len is 240
- config data checksum has 8-bit


Yannick Fertre (2):
  dt-bindings: touchscreen: goodix: support of gt9147
  Input: goodix - support gt9147 touchpanel

 Documentation/devicetree/bindings/input/touchscreen/goodix.yaml | 1 +
 drivers/input/touchscreen/goodix.c                              | 2 ++
 2 files changed, 3 insertions(+)

--
2.7.4

