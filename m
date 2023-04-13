Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E366E1095
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 17:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjDMPFs (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 11:05:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbjDMPFk (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 11:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3F98A46
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 08:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681398297;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yJgyw2CXQSH4cqUvLiXLNVt/tWYZtij7Uerp9ANT68M=;
        b=EzoU+YZct8KRverQgyu2Xt25xxZL52fXhsGkN/BeHWsmOjQ+B+wQKtSDY5dPLNXDyjSMv+
        SQTITB89fC6XuYFDNale7TTLdG67OoZUV6HPW1GYHEnMG+QUNbmVrFYnc758YF6Do6FMOo
        7uA8foSg/WgI2K0oP6B9MLtyVSzngIw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-av4fE8hIO3G5pkYJ8IQJyQ-1; Thu, 13 Apr 2023 11:04:47 -0400
X-MC-Unique: av4fE8hIO3G5pkYJ8IQJyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EAD382807D71;
        Thu, 13 Apr 2023 15:04:22 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 010E61415117;
        Thu, 13 Apr 2023 15:04:21 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230215-power_supply-leds-hid-v1-0-35b6f1dcee8a@weissschuh.net>
References: <20230215-power_supply-leds-hid-v1-0-35b6f1dcee8a@weissschuh.net>
Subject: Re: (subset) [PATCH 0/4] HID: explicitly include linux/leds.h
Message-Id: <168139826149.850074.8414740251523173187.b4-ty@redhat.com>
Date:   Thu, 13 Apr 2023 17:04:21 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 15 Feb 2023 01:03:33 +0000, Thomas Weißschuh wrote:
> Instead of relying on an accidental, transitive inclusion of linux/leds.h
> use it directly.
> 
> 

Applied to hid/hid.git (for-6.4/apple), thanks!

[4/4] HID: apple: explicitly include linux/leds.h
      https://git.kernel.org/hid/hid/c/6c89c1160321

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

