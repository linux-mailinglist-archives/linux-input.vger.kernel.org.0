Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3055256831
	for <lists+linux-input@lfdr.de>; Wed, 26 Jun 2019 14:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZMFJ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 26 Jun 2019 08:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:46534 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726104AbfFZMFJ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 26 Jun 2019 08:05:09 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D30A2080C;
        Wed, 26 Jun 2019 12:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561550708;
        bh=70eVRwnnTij2furD7F8EM2g8IoyCAGJ/R3jsbv9N3ZI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=V/RaBQHiq4zyVrPxJelM7ET7cRiqZUqhwrxrEGk1fVXJHXhWMQ1OflOSi2qjG6ks6
         gAYIZxf61+t9VH4dYHtrPIJDvQ8LzoFBVL1h+mx/G4FLN2RMZKSpaD6TD7V1kMWoJS
         mktTA1pjM9NTXIztdenNx4n9cQ43ai+E5FVYMDFU=
Date:   Wed, 26 Jun 2019 14:05:05 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Add pointstick support for ALPS
 Touchpad
In-Reply-To: <20190614085655.8255-1-kai.heng.feng@canonical.com>
Message-ID: <nycvar.YFH.7.76.1906261404540.27227@cbobk.fhfr.pm>
References: <20190614085655.8255-1-kai.heng.feng@canonical.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 14 Jun 2019, Kai-Heng Feng wrote:

> There's a new ALPS touchpad/pointstick combo device that requires
> MT_CLS_WIN_8_DUAL to make its pointsitck work as a mouse.
> 
> The device can be found on HP ZBook 17 G5.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Applied to for-5.2/fixes. Thanks,

-- 
Jiri Kosina
SUSE Labs

