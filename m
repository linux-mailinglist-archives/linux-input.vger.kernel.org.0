Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1913F320806
	for <lists+linux-input@lfdr.de>; Sun, 21 Feb 2021 02:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbhBUBr2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 20 Feb 2021 20:47:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:44774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229811AbhBUBr2 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Sat, 20 Feb 2021 20:47:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDE8F64EE9;
        Sun, 21 Feb 2021 01:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613872008;
        bh=39DJsqYrFzwUXGjqz5oBjzeVWF3z6iA+PqrGTYhq7Dg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mVvQZJdICRMn7s0D/yso4lPZmOZ9zBDIjrDjaxyJuyi68lsiCO9nSpPcfhI6CaENq
         cAdG6iM/ot6WEbSTuBkSYpnahA+xFmXficRAxc+DqZV/kx5UChsPpxoVmXfh9Mbzx2
         wj9ZQnH3JKOjOG5j0FWl5i4JBXjusKq/AqXYFwRxv+0WyydqdDbTHSAwejuPB0kCRH
         kXhvzuFV0lmgscxYbGxzSToBFZRqRAWKtNpYZbReEOW9VGUyqx0I/AWAtpzgGulSVo
         P/8SvE72MtwJXpjZmDEW31P8T7y1Exzugfa1emOHxxDVeoZTiYFD3L9n4u8pDRgnfr
         73H3iLeF6J8RA==
Date:   Sun, 21 Feb 2021 02:46:44 +0100
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        alsa-devel@alsa-project.org
Subject: Re: [PATCH 1/3] HID: elan: Silence mute LED errors being logged
 when the device is unplugged
Message-ID: <20210221024644.185eb607@kernel.org>
In-Reply-To: <20210220163211.323178-1-hdegoede@redhat.com>
References: <20210220163211.323178-1-hdegoede@redhat.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 20 Feb 2021 17:32:09 +0100
Hans de Goede <hdegoede@redhat.com> wrote:

> 1. Don't log an error from elan_mute_led_set_brigtness() when ret =3D=3D =
ENODEV
ret =3D=3D -ENODEV

Otherwise
Reviewed-by: Marek Beh=C3=BAn <kabel@kernel.org>
