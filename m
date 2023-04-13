Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FECF6E1094
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 17:05:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjDMPFR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 11:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbjDMPFQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 11:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 619329038
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 08:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681398268;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6yfErlPJ2vr74VduI57GspiDRqXQfNKwB+SR/G23mKM=;
        b=iXReiKTRLIdxZ32zf4RvKpxzr0pxBtT7htYDga05sFqGpAaOXgAKWm5k4kqUDtDHcUVQj8
        hzKN3qiWGqKdCQaZYgkW41lEaglQWogMjmOU6Cadfsplp8E6LaFrPGONXuB1qiaQvskjH4
        dsiKxNfh46KgNZydweYvN7diyNlOCvA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-FagzRnX4PMiSla0_pWqL6w-1; Thu, 13 Apr 2023 11:04:25 -0400
X-MC-Unique: FagzRnX4PMiSla0_pWqL6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC647101A551;
        Thu, 13 Apr 2023 15:04:23 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 42538141511D;
        Thu, 13 Apr 2023 15:04:23 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, jkosina@suse.cz,
        Alex Henrie <alexhenrie24@gmail.com>
In-Reply-To: <20230404024829.13982-1-alexhenrie24@gmail.com>
References: <20230404024829.13982-1-alexhenrie24@gmail.com>
Subject: Re: [PATCH] HID: apple: Set the tilde quirk flag on the Geyser 3
Message-Id: <168139826304.850074.2716895482881756924.b4-ty@redhat.com>
Date:   Thu, 13 Apr 2023 17:04:23 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Mon, 03 Apr 2023 20:48:29 -0600, Alex Henrie wrote:
> I was finally able to obtain a MacBook1,1 to test and I've now confirmed
> that it has the tilde key quirk as well:
> 
> Product    Model  Year  System      CPU    Shape  Labels     Country  Quirky
> ============================================================================
> 05ac:0218  A1181  2006  MacBook1,1  T2500  ISO    British    13       Yes
> 
> [...]

Applied to hid/hid.git (for-6.4/apple), thanks!

[1/1] HID: apple: Set the tilde quirk flag on the Geyser 3
      https://git.kernel.org/hid/hid/c/29e1ecc197d4

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

