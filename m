Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC34F18DC56
	for <lists+linux-input@lfdr.de>; Sat, 21 Mar 2020 01:06:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727577AbgCUAGE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 20 Mar 2020 20:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:50000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726773AbgCUAGD (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 20 Mar 2020 20:06:03 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0EDE2076E;
        Sat, 21 Mar 2020 00:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584749163;
        bh=P77blU+WYc5d8OGwI8iIPpXB2snWCNmdFUm3u/qzuP8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=psuo2HNBZcGclb/4YMRBC7mGoShFKKY7fj0+WLb0zOEegRlE0F0guluWhxx6VIYAP
         Z1jYfCSPaVpnlHycJkYOkK5frY1nTH6DRRqZ0XibTVX5vPKBnIyw9iwzDMEw1I0HUZ
         ecbRkz5AjztEba8LTODZtLWpru6k3XmKJAARh5qU=
Date:   Sat, 21 Mar 2020 01:05:59 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Peter Hutterer <peter.hutterer@who-t.net>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <superm1@gmail.com>,
        =?ISO-8859-15?Q?Filipe_La=EDns?= <lains@archlinux.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Richard Hughes <hughsient@gmail.com>
Subject: Re: [PATCH] HID: logitech-dj: issue udev change event on device
 connection
In-Reply-To: <20200319022331.GA2384843@jelly>
Message-ID: <nycvar.YFH.7.76.2003210103540.19500@cbobk.fhfr.pm>
References: <20200318161906.3340959-1-lains@archlinux.org> <CA+EcB1MoTXMaueJfRHf51A5PU4oiKSJXrHazfTEvifZK54OrLQ@mail.gmail.com> <e8ea0c2e-445f-21e2-a248-3368f26bf391@redhat.com> <20200319022331.GA2384843@jelly>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 19 Mar 2020, Peter Hutterer wrote:

> > Then we would need to support that attribute forever. IMHO the best
> > option is to just make a uname call and check the kernel version, with
> > the code marked to be removed in the future when kernels older then
> > $version are no longer something we want to support.

Oh, this doesn't work *at all* with distro kernels backporting everything 
that passess by to kernels with major versions looking years old.

I (as one of the "guilty ones" with my distro hat on) am not at all saying 
it's perfect, but that's the way it is.

-- 
Jiri Kosina
SUSE Labs

