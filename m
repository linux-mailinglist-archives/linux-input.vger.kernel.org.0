Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F408235F41C
	for <lists+linux-input@lfdr.de>; Wed, 14 Apr 2021 14:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231431AbhDNMk5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 14 Apr 2021 08:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347175AbhDNMk4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 14 Apr 2021 08:40:56 -0400
X-Greylist: delayed 311 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 14 Apr 2021 05:40:33 PDT
Received: from forward102p.mail.yandex.net (forward102p.mail.yandex.net [IPv6:2a02:6b8:0:1472:2741:0:8b7:102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3C2C061574
        for <linux-input@vger.kernel.org>; Wed, 14 Apr 2021 05:40:32 -0700 (PDT)
Received: from iva5-a79339517296.qloud-c.yandex.net (iva5-a79339517296.qloud-c.yandex.net [IPv6:2a02:6b8:c0c:7faa:0:640:a793:3951])
        by forward102p.mail.yandex.net (Yandex) with ESMTP id B9A7E1D42B10;
        Wed, 14 Apr 2021 15:35:15 +0300 (MSK)
Received: from iva3-dd2bb2ff2b5f.qloud-c.yandex.net (iva3-dd2bb2ff2b5f.qloud-c.yandex.net [2a02:6b8:c0c:7611:0:640:dd2b:b2ff])
        by iva5-a79339517296.qloud-c.yandex.net (mxback/Yandex) with ESMTP id zZWMs3Hdqk-ZFIGVQO8;
        Wed, 14 Apr 2021 15:35:15 +0300
Authentication-Results: iva5-a79339517296.qloud-c.yandex.net; dkim=pass
Received: by iva3-dd2bb2ff2b5f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id SRtPtFhiGF-ZFL4FtbM;
        Wed, 14 Apr 2021 15:35:15 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
In-Reply-To: <8a538cad-c3f2-6172-1d6e-a18c89b51337@astralinux.ru>
To:     Dmitry Mastykin <dmastykin@astralinux.ru>,
        linux-input@vger.kernel.org
From:   Vitaly Minko <vitaly@minko.me>
Subject: UPD: hid-multitouch: goodix: hovering works as touch
Cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>
Message-ID: <ab5ad25b-d39c-83fe-4a88-eebed7f8b23a@minko.me>
Date:   Wed, 14 Apr 2021 18:35:04 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: ru
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hello Dmitry,


I have faced with exactly the same problem. Have you managed to solve 
the issue?

If yes, could you please share the patch?

Thanks in advance!


Best regards,

Vitaly

