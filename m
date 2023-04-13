Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 572F96E101D
	for <lists+linux-input@lfdr.de>; Thu, 13 Apr 2023 16:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbjDMOiQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Apr 2023 10:38:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbjDMOiP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Apr 2023 10:38:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2794C3C
        for <linux-input@vger.kernel.org>; Thu, 13 Apr 2023 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681396653;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UHajKfH+o7wlvgGh+c+N1+HQ46AVOgr6MUsAGRFZysE=;
        b=NTXyxUt+5i5D1em5KZQgIARbCYu6XmZE2FZV7NjixERYUd/VTlQegkCAD01ZRYxFKrI1K1
        nXGX9YClhldzD/g9yCQsc47t5/TCaT7s72RnFSMtHd7CBDqAMxLRz1CzO882g6/F10OPsx
        SlbWKpfzZum0KRDCR+GHG6n17t0wcb8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-623-NrC4DINrOaq_eCtRpmNzwQ-1; Thu, 13 Apr 2023 10:37:29 -0400
X-MC-Unique: NrC4DINrOaq_eCtRpmNzwQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63487800B35;
        Thu, 13 Apr 2023 14:37:29 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 23C91492B00;
        Thu, 13 Apr 2023 14:37:27 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, Ping Cheng <pinglinux@gmail.com>
Cc:     jkosina@suse.cz, jason.gerecke@wacom.com, aaron.skomra@wacom.com,
        joshua.dickens@wacom.com, Ping Cheng <ping.cheng@wacom.com>
In-Reply-To: <20230409164229.29777-1-ping.cheng@wacom.com>
References: <20230409164229.29777-1-ping.cheng@wacom.com>
Subject: Re: [PATCH] HID: wacom: Set a default resolution for older tablets
Message-Id: <168139664776.832846.9285685297324282380.b4-ty@redhat.com>
Date:   Thu, 13 Apr 2023 16:37:27 +0200
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

On Sun, 09 Apr 2023 09:42:29 -0700, Ping Cheng wrote:
> Some older tablets may not report physical maximum for X/Y
> coordinates. Set a default to prevent undefined resolution.
> 
> 

Applied to hid/hid.git (for-6.4/wacom), thanks!

[1/1] HID: wacom: Set a default resolution for older tablets
      https://git.kernel.org/hid/hid/c/08a46b4190d3

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

