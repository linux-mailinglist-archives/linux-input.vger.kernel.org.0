Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A178A6A0D92
	for <lists+linux-input@lfdr.de>; Thu, 23 Feb 2023 17:09:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234071AbjBWQJi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 23 Feb 2023 11:09:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234069AbjBWQJh (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 23 Feb 2023 11:09:37 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA17D17168
        for <linux-input@vger.kernel.org>; Thu, 23 Feb 2023 08:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677168530;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oi3onFZdOfhG5g7Va6cusrW8DmCZ28POxDo8cVUlMpQ=;
        b=aujha4V8KUCoBFvxv7I792n2xed4J0PG/+TiC9oLBUpK9uD+ipjySSxCZkAMtAlDe1PJ18
        kE9wAVnhzInjJp/gi7WNGNh/mJmTr68si1HmTq+SuWebcu6ZwiME5nSPiNOpJ1icXTj3qT
        EWugLj6pB12M2O6ImZRC+KKxvHxl8ao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-Dt-ym4uQO-SjfEciavBYqw-1; Thu, 23 Feb 2023 11:08:46 -0500
X-MC-Unique: Dt-ym4uQO-SjfEciavBYqw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3DC84101A521;
        Thu, 23 Feb 2023 16:08:46 +0000 (UTC)
Received: from plouf.local (unknown [10.22.8.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7686492C3E;
        Thu, 23 Feb 2023 16:08:45 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     jikos@kernel.org, Danny Kaehn <kaehndan@gmail.com>
Cc:     linux-input@vger.kernel.org, ethan.twardy@plexus.com
In-Reply-To: <20230210170044.11835-1-kaehndan@gmail.com>
References: <20230210170044.11835-1-kaehndan@gmail.com>
Subject: Re: [PATCH] HID: cp2112: Fix driver not registering GPIO IRQ chip
 as threaded
Message-Id: <167716852549.1538140.9925786530006136542.b4-ty@redhat.com>
Date:   Thu, 23 Feb 2023 17:08:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 10 Feb 2023 11:00:44 -0600, Danny Kaehn wrote:
> The CP2112 generates interrupts from a polling routine on a thread,
> and can only support threaded interrupts. This patch configures the
> gpiochip irq chip with this flag, disallowing consumers to request
> a hard IRQ from this driver, which resulted in a segfault previously.
> 
> 

Applied to hid/hid.git (for-6.3/upstream-fixes), thanks!

[1/1] HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
      https://git.kernel.org/hid/hid/c/37f5b858a665

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

