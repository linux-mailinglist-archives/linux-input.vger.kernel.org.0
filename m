Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D27B206E32
	for <lists+linux-input@lfdr.de>; Wed, 24 Jun 2020 09:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390084AbgFXHty (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 24 Jun 2020 03:49:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:49372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390013AbgFXHty (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 24 Jun 2020 03:49:54 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49BD020768;
        Wed, 24 Jun 2020 07:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592984994;
        bh=fNfnnzHCtg0ae+LKflu55IFif9NwGAY6eDhwVjduTGg=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=HmvfEQ/35SIgpesSvr/h4MOmGnpMpjqzcGNMRK7P8KgCsNgXMFvJMHjr48kW/yPxM
         DLAFzNn8UrXUe5EVJdEkbMloP4v79DIGsIaTQIKYAuloecpAdzbDViq5ATaGjZey3S
         rr/DPK3GuHgKUTWdL/lMtLzrVaqWKGVojnePVC0s=
Date:   Wed, 24 Jun 2020 09:49:51 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, Joao Moreno <mail@joaomoreno.com>
Subject: Re: [PATCH resend] HID: apple: Disable Fn-key key-re-mapping on
 clone keyboards
In-Reply-To: <20200620123229.40402-2-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2006240949220.13242@cbobk.fhfr.pm>
References: <20200620123229.40402-1-hdegoede@redhat.com> <20200620123229.40402-2-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 20 Jun 2020, Hans de Goede wrote:

> The Maxxter KB-BT-001 Bluetooth keyboard, which looks somewhat like the
> Apple Wireless Keyboard, is using the vendor and product IDs (05AC:0239)
> of the Apple Wireless Keyboard (2009 ANSI version) <sigh>.

Oh my god *smacks forehead*.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

