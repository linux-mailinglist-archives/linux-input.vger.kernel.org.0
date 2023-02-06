Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E24168BF05
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:58:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjBFN6s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:58:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbjBFN6g (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:58:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43744298F2
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 05:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675691740;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=udRiWBPGyuwXAzVSmPHabP6GB21GNdoa0SYF1UWmHNI=;
        b=SqUFKFtHCEBnZxVBueGD50gY9apYDVKi3InS9r/wwEcXw6J92yAXS+u6IjzUI7TgGDR4UE
        f9jW6txMlj514xHWw/rq3Orp8ON5NaM40OvrG5195CqC43zeH7i36AfnqFYCaS4N9VV4Za
        2Fs7JlLcaNi6jkZ4BqanNsG5/VWAoxU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-nmDdOM1oM96xkZ5ftwB09g-1; Mon, 06 Feb 2023 08:55:37 -0500
X-MC-Unique: nmDdOM1oM96xkZ5ftwB09g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC19B811E6E;
        Mon,  6 Feb 2023 13:55:36 +0000 (UTC)
Received: from plouf.local (ovpn-192-160.brq.redhat.com [10.40.192.160])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 92E9B2026D37;
        Mon,  6 Feb 2023 13:55:35 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
In-Reply-To: <20221207100033.64095-1-hadess@hadess.net>
References: <20221207100033.64095-1-hadess@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Add constants for HID++ 2.0 error
 codes
Message-Id: <167569173522.2840310.5991743706116877068.b4-ty@redhat.com>
Date:   Mon, 06 Feb 2023 14:55:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 07 Dec 2022 11:00:33 +0100, Bastien Nocera wrote:
> Add constants for HID++ 2.0 error codes listed in "Protocol HID++2.0
> essential features" chapter, page 3, in
> logitech_hidpp_2.0_specification_draft_2012-06-04.pdf
> 
> 

Applied to hid/hid.git (for-6.3/logitech), thanks!

[1/1] HID: logitech-hidpp: Add constants for HID++ 2.0 error codes
      https://git.kernel.org/hid/hid/c/76823bf3d650

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

