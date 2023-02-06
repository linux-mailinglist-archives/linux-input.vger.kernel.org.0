Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1A8D68BF00
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 14:58:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjBFN6J (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 08:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjBFN5z (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 08:57:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2ED28844
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675691742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nNokVNuCbcyYbOvBsg5MpYzBhTyxL8Hfh4ACnAgkZ+o=;
        b=SXkmbx1MTBAky3LPA2nzTxNK2EvL6LqB6BGZiGT+kHwpzsASujCM4NL5MgDk/VIyC7FFty
        0B4OlEc8QtWgwYyB3YWcaaPdnb+hXyLO3RvcaypLimAnToGVWADWjGWgJ6oyuRxCA7dEWv
        eZdBk4yetNDqzng0EhDeP8Zaku5LU14=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-TCsE8-lONU-ZTo0SXnr2eQ-1; Mon, 06 Feb 2023 08:55:39 -0500
X-MC-Unique: TCsE8-lONU-ZTo0SXnr2eQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13ABF3C0E444;
        Mon,  6 Feb 2023 13:55:39 +0000 (UTC)
Received: from plouf.local (ovpn-192-160.brq.redhat.com [10.40.192.160])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78A6D2026D37;
        Mon,  6 Feb 2023 13:55:38 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
Cc:     =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>
In-Reply-To: <20220404100311.3304-1-hadess@hadess.net>
References: <20220404100311.3304-1-hadess@hadess.net>
Subject: Re: [PATCH] HID: logitech-hidpp: Add Signature M650
Message-Id: <167569173827.2840310.9062767836019244889.b4-ty@redhat.com>
Date:   Mon, 06 Feb 2023 14:55:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 04 Apr 2022 12:03:11 +0200, Bastien Nocera wrote:
> Add support for HID++ over Bluetooth for the Logitech Signature
> M650 mouse. It comes with a dongle but can also be used over Bluetooth
> without one.
> 
> 

Applied to hid/hid.git (for-6.3/logitech), thanks!

[1/1] HID: logitech-hidpp: Add Signature M650
      https://git.kernel.org/hid/hid/c/8d24fa97da85

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

