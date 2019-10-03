Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47582CAE85
	for <lists+linux-input@lfdr.de>; Thu,  3 Oct 2019 20:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729763AbfJCSt7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 3 Oct 2019 14:49:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726677AbfJCSt7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 3 Oct 2019 14:49:59 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CADD920862;
        Thu,  3 Oct 2019 18:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570128598;
        bh=6v61rpH7lv72vdxoYtEom12niapnRBb1b/BnPUoUM30=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=XwPvZXBJAn+MEv00mvdLSXUxBU8hYy+HUs8BDvQIIsIWRaZQ5y9ZTWjz5EL2eyrcr
         Gk2F0F4DgzgO+yac2Q7eXm/oc5Bef9crcxet2FCM69ybG9YOxKJ2U+Ztmvlrn0MkLX
         CD3QvdXUS0BtOEhmPVVH76rvq+MYLympjEkyazTE=
Date:   Thu, 3 Oct 2019 20:49:31 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 2/7] HID: Add driver for Logitech gaming keyboards
 (G15, G15 v2)
In-Reply-To: <378599dd-cd9b-98b3-0c8e-b6e7d6a01a06@redhat.com>
Message-ID: <nycvar.YFH.7.76.1910032044520.13160@cbobk.fhfr.pm>
References: <20190828124130.26752-1-hdegoede@redhat.com> <20190828124130.26752-2-hdegoede@redhat.com> <nycvar.YFH.7.76.1910031540530.13160@cbobk.fhfr.pm> <378599dd-cd9b-98b3-0c8e-b6e7d6a01a06@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 3 Oct 2019, Hans de Goede wrote:

> > have one remaining question -- what is the reason you decided to factor
> > this out as a separate driver, instead of putting it under the
> > hid-logitech umbrella?
> 
> I put this in a separate driver, because it is a substantial chunk of code
> and the gaming keyboard stuff shares nothing what so ever with the other
> Logitech bits.

Well, we generally keep the support really divided on the vendor 
granularity, even if code sharing for individual models is minimal.

I mostly personally prefer that due to absolute clarity for people making 
CONFIG_ decisions, but as you put that under the generic Logitech config, 
it's not a big issue.

Queued in for-5.5/logitech now.

-- 
Jiri Kosina
SUSE Labs

