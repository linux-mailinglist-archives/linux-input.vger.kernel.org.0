Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84BD97359B3
	for <lists+linux-input@lfdr.de>; Mon, 19 Jun 2023 16:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjFSOgN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 19 Jun 2023 10:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231314AbjFSOgM (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 19 Jun 2023 10:36:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17DC7124
        for <linux-input@vger.kernel.org>; Mon, 19 Jun 2023 07:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687185324;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ke2aZ6yIyxqxd7jg9okSkx2Bff6qX87dYOpxYejjVyE=;
        b=Ac/WFvYtdzVrnFBvz7srIjT3TuOyRH840/pNQ39Epd5u1rvMXzUUvrXI6n18mkf3YrTdwG
        XM+YJUs+1eKOIMkclT0SpLu1sud/tT0am5exelmm5lOTXXsmL0Xxf3niwi3yGgTYiNoiI5
        rBzGHEqKVou8HtxQsxiU6D3NJBjB5uw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-FuZj9odhPlOKW-sgB42F7A-1; Mon, 19 Jun 2023 10:35:19 -0400
X-MC-Unique: FuZj9odhPlOKW-sgB42F7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CB5280120F;
        Mon, 19 Jun 2023 14:35:18 +0000 (UTC)
Received: from [192.168.110.200] (unknown [10.45.225.218])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7585C164EC;
        Mon, 19 Jun 2023 14:35:17 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, Mike Hommey <mh@glandium.org>
Cc:     =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Jiri Kosina <jikos@kernel.org>
In-Reply-To: <20230617230957.6mx73th4blv7owqk@glandium.org>
References: <20230617230957.6mx73th4blv7owqk@glandium.org>
Subject: Re: [PATCH] HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for
 the T651.
Message-Id: <168718531736.2920085.7885355785622180367.b4-ty@redhat.com>
Date:   Mon, 19 Jun 2023 16:35:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 18 Jun 2023 08:09:57 +0900, Mike Hommey wrote:
> 498ba20690357691103de0f766960355247c78be put restarting communication
> behind that flag, and this was apparently necessary on the T651, but the
> flag was not set for it.
> 
> 

Applied to hid/hid.git (for-6.4/upstream-fixes), thanks!

[1/1] HID: logitech-hidpp: add HIDPP_QUIRK_DELAYED_INIT for the T651.
      https://git.kernel.org/hid/hid/c/5fe251112646

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

