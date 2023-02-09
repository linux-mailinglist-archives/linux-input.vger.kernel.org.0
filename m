Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49E4D690D2C
	for <lists+linux-input@lfdr.de>; Thu,  9 Feb 2023 16:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230286AbjBIPku (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 9 Feb 2023 10:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231428AbjBIPkt (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Thu, 9 Feb 2023 10:40:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F40014EB8
        for <linux-input@vger.kernel.org>; Thu,  9 Feb 2023 07:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675957202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0hQf86nfARy8f4W7PUmEGo7Q+XTg2P97T/ALpblhSTk=;
        b=Dfc9md/WbVKXV6Olt8SYvZMSB6cW4nNN+dabh1/U96rm815MhynTSLGHWxkemum6Fuy6Gh
        wv6yun9np4QYN/wt7s4o0wH8dWiTSi9yB948U5CYC33iAZ2i3b8bdAp4uM7pJxZyKgbZSw
        IGc/y1kfYzB1cPepFjFEC07Yqc36IU0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-TC_lS1usPTuLB-2OhgiORQ-1; Thu, 09 Feb 2023 10:39:57 -0500
X-MC-Unique: TC_lS1usPTuLB-2OhgiORQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F561C08794;
        Thu,  9 Feb 2023 15:39:56 +0000 (UTC)
Received: from plouf.local (ovpn-192-232.brq.redhat.com [10.40.192.232])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DDA44140EBF6;
        Thu,  9 Feb 2023 15:39:54 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, Bastien Nocera <hadess@hadess.net>
Cc:     linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        "Peter F . Patel-Schneider" <pfpschneider@gmail.com>,
        =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
        Nestor Lopez Casado <nlopezcasad@logitech.com>
In-Reply-To: <20230206221256.129198-1-hadess@hadess.net>
References: <20230206221256.129198-1-hadess@hadess.net>
Subject: Re: (subset) [PATCH v2 1/3] HID: logitech-hidpp: Add more debug
 statements
Message-Id: <167595719424.371927.3678472760896974183.b4-ty@redhat.com>
Date:   Thu, 09 Feb 2023 16:39:54 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 06 Feb 2023 23:12:54 +0100, Bastien Nocera wrote:
> This should help us figure out some hairy problems with some devices.
> 
> 

Applied to hid/hid.git (for-6.3/logitech), thanks!

[1/3] HID: logitech-hidpp: Add more debug statements
      https://git.kernel.org/hid/hid/c/db5167cfaa0a

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

