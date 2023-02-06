Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8CA368BE3A
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbjBFNbz (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:31:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbjBFNbx (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:31:53 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBC723C44
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 05:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675690265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p/yG4J9Ql/bW+p/xKSR25YcUKgBdXeKMyLfAbvdTBhw=;
        b=cPO1zmOim9ulT0nqXaeBi/2pPapmXCaq6djjSqEHAnQIMeN7Emdun1EnK1dJOVYuzGp3xk
        yprhpH0Jsjaa88SKAPcvsHnhlNyUy15ZpjH0Cwh7hrACuyn2KLj16QdVjDfoQS6mCbV1FU
        oZGCpgPX58bWAGYlCFN5wOM1mffrQ0s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-582-tTA3LfPHOqapV-1ICjxHhA-1; Mon, 06 Feb 2023 08:31:01 -0500
X-MC-Unique: tTA3LfPHOqapV-1ICjxHhA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E1FE3828888;
        Mon,  6 Feb 2023 13:31:01 +0000 (UTC)
Received: from plouf.local (ovpn-192-160.brq.redhat.com [10.40.192.160])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CEA51492B21;
        Mon,  6 Feb 2023 13:31:00 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     jikos@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Xin Zhao <xnzhao@google.com>
In-Reply-To: <20230130212947.1315941-1-xnzhao@google.com>
References: <20230130212947.1315941-1-xnzhao@google.com>
Subject: Re: [PATCH] HID: core: Fix deadloop in hid_apply_multiplier.
Message-Id: <167569026047.2830974.6190968641295254608.b4-ty@redhat.com>
Date:   Mon, 06 Feb 2023 14:31:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 30 Jan 2023 21:29:47 +0000, Xin Zhao wrote:
> The initial value of hid->collection[].parent_idx if 0. When
> Report descriptor doesn't contain "HID Collection", the value
> remains as 0.
> 
> In the meanwhile, when the Report descriptor fullfill
> all following conditions, it will trigger hid_apply_multiplier
> function call.
> 1. Usage page is Generic Desktop Ctrls (0x01)
> 2. Usage is RESOLUTION_MULTIPLIER (0x48)
> 3. Contain any FEATURE items
> 
> [...]

Applied to hid/hid.git (for-6.2/upstream-fixes), thanks!

[1/1] HID: core: Fix deadloop in hid_apply_multiplier.
      https://git.kernel.org/hid/hid/c/ea427a222d8b

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

