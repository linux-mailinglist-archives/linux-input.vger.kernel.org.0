Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C340D7E0B6D
	for <lists+linux-input@lfdr.de>; Fri,  3 Nov 2023 23:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234115AbjKCWw6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 3 Nov 2023 18:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbjKCWw6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 3 Nov 2023 18:52:58 -0400
X-Greylist: delayed 590 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 03 Nov 2023 15:52:55 PDT
Received: from mail.celforyon.fr (unknown [IPv6:2001:41d0:1004:1a5d::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0194D18B
        for <linux-input@vger.kernel.org>; Fri,  3 Nov 2023 15:52:54 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC0951784396
        for <linux-input@vger.kernel.org>; Fri,  3 Nov 2023 23:43:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldred.fr; s=dkim;
        t=1699051382; h=from:subject:date:message-id:to:mime-version:content-type:
         content-transfer-encoding:content-language;
        bh=7e0GxoRLEI7qv6YePk/r+vXaVfW0UbuVC+0C3kR3dgY=;
        b=d5JZb2lgYVc3j9zv+HvD64ZweHdqF2GwCBoD9JVPByRpuBxg/Crcilys5DeWjmEqEle8F6
        AsRc4t25rrhQ49SSKx45QuXWWJ+Fe9woLHN1gBpUJ8WueM7zWOHDpEXF+d7B4y1I8g76Sp
        a4fEJ+h90NYVSgpJjjsCHwQlqmkWaNofaHSaje5wKwiAe5l8siZfd9r/rgpYNRfP0f2ZfF
        jgXOXndXBhBLs73vFkxanKjEQettAMDK/h0/Afckq170Gd7qKiUeY/1bOrMg1ohr1jiDKB
        qQbdssPQigRcXu7B0UBMmh8NSGKJOJgjH/5sl43MatX4ti0ubcB6BAm7zlCZPQ==
Message-ID: <2f02766e-44bc-45d8-96fe-afbd4e389cdc@eldred.fr>
Date:   Fri, 3 Nov 2023 23:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To:     linux-input@vger.kernel.org
From:   Eldred HABERT <me@eldred.fr>
Subject: Synaptics "different bus" message
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=1.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RDNS_NONE,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello!

I was browsing my kernel logs while troubleshooting something else, and 
I happened upon the following message:

psmouse serio1: synaptics: Your touchpad (PNP: SYN1509 SYN1500 SYN0002 
PNP0f13 SYN1507) says it can support a different bus. If i2c-hid and 
hid-rmi are not used, you might want to try setting 
psmouse.synaptics_intertouch to 1 and report this to 
linux-input@vger.kernel.org.

I have tried unloading and re-loading the `psmouse` driver with that 
parameter, and the touchpad seems to function normally. And I'm 
reporting this :)

Do I need to take any further action?

Cheers,
~ ISSOtm

