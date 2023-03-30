Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C5196D0A8A
	for <lists+linux-input@lfdr.de>; Thu, 30 Mar 2023 17:59:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbjC3P7w (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 30 Mar 2023 11:59:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233564AbjC3P7t (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 30 Mar 2023 11:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB692133
        for <linux-input@vger.kernel.org>; Thu, 30 Mar 2023 08:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680191947;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CM6lDeCs/lTBZVjR0G4445A/lM9wslt+eek87Y+gM3U=;
        b=awfWK9aDEFCzC7REfK5FQvYWjKifZjCd0R8rxaI3skKEDKt/evYgHa5cCOESLh34EM6cOA
        qPztkVDhnWOXKwwghX2iXWiiHiLT92WHfGBLNygTBwhBTCUs0/2BnajBNgiiJRaoCbdmdx
        PJ3cv2YQ1v4WmwyhnCLJFs2IlpJw5Ss=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-omIXy9QYNIa0ebnPJtLufg-1; Thu, 30 Mar 2023 11:59:03 -0400
X-MC-Unique: omIXy9QYNIa0ebnPJtLufg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A9A382823811;
        Thu, 30 Mar 2023 15:59:02 +0000 (UTC)
Received: from plouf.local (unknown [10.45.224.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 299A01458896;
        Thu, 30 Mar 2023 15:59:01 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
        "Gerecke, Jason" <killertofu@gmail.com>
Cc:     Ping Cheng <pinglinux@gmail.com>,
        Aaron Armstrong Skomra <skomra@gmail.com>,
        Joshua Dickens <joshua@joshua-dickens.com>,
        Jason Gerecke <jason.gerecke@wacom.com>,
        Ping Cheng <ping.cheng@wacom.com>
In-Reply-To: <20221019151832.44522-1-jason.gerecke@wacom.com>
References: <20221019151832.44522-1-jason.gerecke@wacom.com>
Subject: Re: [PATCH] HID: Recognize "Digitizer" as a valid input
 application
Message-Id: <168019194076.3713924.7189195561442762046.b4-ty@redhat.com>
Date:   Thu, 30 Mar 2023 17:59:00 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 19 Oct 2022 08:18:32 -0700, Gerecke, Jason wrote:
> "Digitizer" is a generic usage that may be used by various devices but
> which is particularly used by non-display pen tablets. This patch adds the
> usage to the list of values matched by the IS_INPUT_APPLICATION() macro
> that determines if an input device should be allocated or not.
> 
> 

Applied to hid/hid.git (for-6.4/core), thanks!

[1/1] HID: Recognize "Digitizer" as a valid input application
      https://git.kernel.org/hid/hid/c/a0f5276716c8

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

