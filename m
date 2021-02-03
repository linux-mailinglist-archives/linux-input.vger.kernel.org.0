Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A4030DCA1
	for <lists+linux-input@lfdr.de>; Wed,  3 Feb 2021 15:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhBCOYW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 3 Feb 2021 09:24:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26675 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232713AbhBCOYQ (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 3 Feb 2021 09:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612362170;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3xWLX20KnSq7G5ofmlPC/VwP2FA7d4Kic/EX2+ofCBw=;
        b=BwGl9k575vkHD7MI9owk3+wweXII/3cuTgZsLrYzIQwPKMW76khNhSzFgiinYUZF4sgOoL
        d0K4vxnsO8G2MXKesnSF4atHL0dXvljpSpjUan2ZXGpNnll0CJKdv3tGDuR1vanizGSXGl
        e//L6R9F0njePF17sUUaRsu2/PGdnuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-XA9H55P5NW2AW_YuhKhu5g-1; Wed, 03 Feb 2021 09:22:49 -0500
X-MC-Unique: XA9H55P5NW2AW_YuhKhu5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E784107ACE8;
        Wed,  3 Feb 2021 14:22:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-27.ams2.redhat.com [10.36.113.27])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 436F61002391;
        Wed,  3 Feb 2021 14:22:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 0EAA01800853; Wed,  3 Feb 2021 15:22:39 +0100 (CET)
Date:   Wed, 3 Feb 2021 15:22:39 +0100
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
Cc:     virtualization@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Mathias Crombez <mathias.crombez@faurecia.com>
Subject: Re: [PATCH RESEND v3] virtio-input: add multi-touch support
Message-ID: <20210203142239.7lknkkg4zx5kuaf2@sirius.home.kraxel.org>
References: <20210115002623.8576-1-vasyl.vavrychuk@opensynergy.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115002623.8576-1-vasyl.vavrychuk@opensynergy.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Jan 15, 2021 at 02:26:23AM +0200, Vasyl Vavrychuk wrote:
> From: Mathias Crombez <mathias.crombez@faurecia.com>
> 
> Without multi-touch slots allocated, ABS_MT_SLOT events will be lost by
> input_handle_abs_event.
> 
> Implementation is based on uinput_create_device.
> 
> Signed-off-by: Mathias Crombez <mathias.crombez@faurecia.com>
> Co-developed-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
> Signed-off-by: Vasyl Vavrychuk <vasyl.vavrychuk@opensynergy.com>
> ---
> v2: fix patch corrupted by corporate email server
> v3: use number of slots from the host
> 
> Resend since to feedback.
> 
>  drivers/virtio/virtio_input.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Have no test hardware, the logic looks sane though.

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

take care,
  Gerd

