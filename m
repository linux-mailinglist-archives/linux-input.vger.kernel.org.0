Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF33668B8C3
	for <lists+linux-input@lfdr.de>; Mon,  6 Feb 2023 10:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjBFJek (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 6 Feb 2023 04:34:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjBFJej (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 6 Feb 2023 04:34:39 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18DF15C89
        for <linux-input@vger.kernel.org>; Mon,  6 Feb 2023 01:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675676031;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GswRFrVYeAz1iJbYjmOiJhUkJYwqwi7TCEeuII2wTkM=;
        b=K3qe7VS7+1XBEj709NPeIkeT/Nhdyxxedpt089eC76SLU+ci2r3pPAuJemGrdcTGmDlw90
        uGiUrHQLVNQrzmfnWZkXDF5ENQdp6NIwyu7Q51WeuPBE/IjtdJ+zF/Qt2rceVOETliKBOy
        g/6PxZGQ7C3Hnibd+FROQ9y8IvCzBBc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-fZmGjddhOWKcCDte45eR_g-1; Mon, 06 Feb 2023 04:33:48 -0500
X-MC-Unique: fZmGjddhOWKcCDte45eR_g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0833785C70D;
        Mon,  6 Feb 2023 09:33:48 +0000 (UTC)
Received: from plouf.local (ovpn-192-160.brq.redhat.com [10.40.192.160])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D8548492B21;
        Mon,  6 Feb 2023 09:33:46 +0000 (UTC)
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
To:     Jiri Kosina <jikos@kernel.org>, Lyude Paul <lyude@redhat.com>,
        linux-input@vger.kernel.org, Vicki Pfau <vi@endrift.com>
In-Reply-To: <20230126030126.895670-1-vi@endrift.com>
References: <20230111012336.2915827-2-vi@endrift.com>
 <20230126030126.895670-1-vi@endrift.com>
Subject: Re: [PATCH v2 0/2] HID: hid-steam: Add Steam Deck support
Message-Id: <167567602651.2777126.7460561018933645385.b4-ty@redhat.com>
Date:   Mon, 06 Feb 2023 10:33:46 +0100
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

On Wed, 25 Jan 2023 19:01:24 -0800, Vicki Pfau wrote:
> Revised version of this patchset based on received feedback, as well as an
> additional bugfix for the edge case where the driver attempts to schedule the
> alread-scheduled lizard mode heartbeat, leading to a deadlock.
> 
> Vicki Pfau (2):
>   HID: hid-steam: Add Steam Deck support
>   HID: hid-steam: Add rumble on Deck
> 
> [...]

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git (for-6.3/steam), thanks!

[1/2] HID: hid-steam: Add Steam Deck support
      https://git.kernel.org/hid/hid/c/9ba9498bff1a
[2/2] HID: hid-steam: Add rumble on Deck
      https://git.kernel.org/hid/hid/c/9cd61c817978

Cheers,
-- 
Benjamin Tissoires <benjamin.tissoires@redhat.com>

