Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 997322EEA7A
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 01:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729552AbhAHAia (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 7 Jan 2021 19:38:30 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:50475 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729540AbhAHAia (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 7 Jan 2021 19:38:30 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 8D43316C0
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 19:37:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 07 Jan 2021 19:37:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-type:date:from:message-id
        :mime-version:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=z2gFosycv/4d8F4IH6M5EFvOMVfX/xiPl+lWjQfsK
        QI=; b=F7BA5KZHV0jconHh+hkNE0GPl8pqjNid28dRfNKCBx4ylIYNEy+JBHwMq
        9zp9tgpYczNVpnqKLiGriABxkBLxSLA/VBF/rOjlXeVxYrEU0nQh2ovXAKIeg2cA
        d3zp1ukwNyi5M7Yn6T794uc4bjDnPEZ9wgnhEEdcZxRs/KbXUojcn1HfUq2n53x0
        ztV26V1vJsNR1vChX0gB65Y92m2TA9iGlZQcOvJSTFGp/bRM6cd6TBy+RWwV5ZDy
        Vay40i0nV2VYhLWdi5B8KAXDf27bs3yy+rLRulI2So+SOI8CBodJMvD290SRFezS
        NmwSpdAjNkcmtaWJfaxnKGdmkB+ng==
X-ME-Sender: <xms:Uqn3X7pLdsvwXVuhPXfq33qjqK_T46YtHa_ySjxkLlJ1m6N3OT_Nyg>
    <xme:Uqn3X1p21UwvR9zGBcPfV_bKFT030xeqx9vqDnQzG9ohaTaySPg93G3NH0ZBVwy0_
    3RdT9cZzgGAltNiRHo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdegfedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucfgmhhpthihuchsuhgsjhgvtghtucdluddtmdenuc
    fjughrpeffhffvkffogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgculfhonhgv
    shcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpefhvdettd
    efkeehlefgkeelvdefteevheejleejgfejheduuddugeefveeitdetgfenucfkphepudeh
    tddruddtjedrudejvddruddvtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:Uqn3X4OYkJ1PqvfS6CypZroowdFIW8QnWl42KLATik3q3uwFUcv7bQ>
    <xmx:Uqn3X-4NPneFuJMWdk3S2_4wEefqP_C3CbZIYoWD7uG0oIrp7FhS6w>
    <xmx:Uqn3X66Gm_2shfB6BI0Gm-9HM5ZuhNgMu4Nc7bHAtmf1zzFUwSSctg>
    <xmx:U6n3X5LpXgQnwWGje9ccd8K0o-9X9Af8a9KIgyH_Dz4zi0xx68UBmA>
Received: from [192.168.20.6] (unknown [150.107.172.120])
        by mail.messagingengine.com (Postfix) with ESMTPA id D49791080057
        for <linux-input@vger.kernel.org>; Thu,  7 Jan 2021 19:37:37 -0500 (EST)
Date:   Fri, 08 Jan 2021 13:37:23 +1300
From:   Luke Jones <luke@ljones.dev>
To:     linux-input <linux-input@vger.kernel.org>
Message-Id: <B2BLMQ.6IGY3GUDS7NH@ljones.dev>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

unsubscribe linux-kernel


