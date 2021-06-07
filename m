Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0642439DFEB
	for <lists+linux-input@lfdr.de>; Mon,  7 Jun 2021 17:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhFGPFl (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 7 Jun 2021 11:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230198AbhFGPFl (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 7 Jun 2021 11:05:41 -0400
X-Greylist: delayed 423 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 07 Jun 2021 08:03:50 PDT
Received: from latitanza.investici.org (latitanza.investici.org [IPv6:2001:888:2000:56::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 139EEC061766
        for <linux-input@vger.kernel.org>; Mon,  7 Jun 2021 08:03:50 -0700 (PDT)
Received: from mx3.investici.org (unknown [127.0.0.1])
        by latitanza.investici.org (Postfix) with ESMTP id 4FzGfh6lXmzGp2t
        for <linux-input@vger.kernel.org>; Mon,  7 Jun 2021 14:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=autistici.org;
        s=stigmate; t=1623077804;
        bh=drIYtE9YNOUvLbj74nik26kKbpDez0QoyNgyxMADdww=;
        h=From:To:Subject:Date:From;
        b=koOxgXNyPDrwRtr81CfDSNu7h/Y1Ji81rIIHX648P7xhbhuOhu2sZequSB1Yazjjc
         wVOlhSFUOEgIgkVjzb5lhdkQ7UiSzmsGxtYwGS3bmlEv0LwFjG7wpnmec7BHPPm90R
         V70fdAl1TZb+bsauejv1fH4lwWhkEZayDTvjYDsE=
Received: from [82.94.249.234] (mx3.investici.org [82.94.249.234]) (Authenticated sender: andrea.monaco@autistici.org) by localhost (Postfix) with ESMTPSA id 4FzGfh5wz9zGp2l
        for <linux-input@vger.kernel.org>; Mon,  7 Jun 2021 14:56:44 +0000 (UTC)
From:   "Andrea G. Monaco" <andrea.monaco@autistici.org>
To:     linux-input@vger.kernel.org
Subject: Report descriptor is printed partially
Date:   Mon, 07 Jun 2021 16:56:33 +0200
Message-ID: <87pmwxwwny.fsf@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


Hello everyone,


while investigating a problem with my touchpad in i2c_hid, I found out that the
%*ph specifier in printk only prints 64 bytes at most
(https://www.kernel.org/doc/html/latest/core-api/printk-formats.html).
That means the line


	i2c_hid_dbg(ihid, "Report Descriptor: %*ph\n", rsize, rdesc);


in i2c_parse only prints the beginning of the report descriptor. My
touchpad declares a 665 bytes long descriptor, so I guess it is usually
much bigger than 64. 


Perhaps we could dump the full descriptor, or at least make this limit
clear.



Andrea Monaco
