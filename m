Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB5736D9BF9
	for <lists+linux-input@lfdr.de>; Thu,  6 Apr 2023 17:16:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239470AbjDFPQ5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 6 Apr 2023 11:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238356AbjDFPQ4 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 6 Apr 2023 11:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B79D9EE2
        for <linux-input@vger.kernel.org>; Thu,  6 Apr 2023 08:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680794167;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u9OSztgIiEWra8VRNmn67+Xx/xyyO7zXP50amnhz+lI=;
        b=Vz3l/MP+EY2lSMFruJzg8sbEpF0rf2+HpqClbygFX23fo3na3qF5RNyrmV4AFqZ385A00d
        JMjFoJs9Og+S5YrS8EMWdHvX8+MVtFpMJL2A/k4wryfX2ZwnNogchRZkxuULGjuGe2tDvz
        XJhtj06FU3dvKBh7ucd6UQ/vtSK0cbc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-mvUt6tq_PN6OxLTr7JfxHg-1; Thu, 06 Apr 2023 11:16:03 -0400
X-MC-Unique: mvUt6tq_PN6OxLTr7JfxHg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F66F1C05B04;
        Thu,  6 Apr 2023 15:15:57 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 10FD71121314;
        Thu,  6 Apr 2023 15:15:54 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
In-Reply-To: <20230405092754.36579-1-hadess@hadess.net>
References: <20230405092754.36579-1-hadess@hadess.net>
Subject: Re: [PATCH v2] USB: core: Fix docs warning caused by
 wireless_status feature
Message-Id: <168079415445.516294.11908833077816584488.b4-ty@redhat.com>
Date:   Thu, 06 Apr 2023 17:15:54 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 05 Apr 2023 11:27:54 +0200, Bastien Nocera wrote:
> Fix wrongly named 'dev' parameter in doc block, should have been iface:
> drivers/usb/core/message.c:1939: warning: Function parameter or member 'iface' not described in 'usb_set_wireless_status'
> drivers/usb/core/message.c:1939: warning: Excess function parameter 'dev' description in 'usb_set_wireless_status'
> 
> And fix missing struct member doc in kernel API, and reorder to
> match struct:
> include/linux/usb.h:270: warning: Function parameter or member 'wireless_status_work' not described in 'usb_interface'
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.4/logitech-hidpp), thanks!

[1/1] USB: core: Fix docs warning caused by wireless_status feature
      https://git.kernel.org/hid/hid/c/539adfedbd2d

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

