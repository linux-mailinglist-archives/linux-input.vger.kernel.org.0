Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89B1F331245
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 16:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCHPdd (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 10:33:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60660 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229459AbhCHPdO (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 10:33:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEEEE65268;
        Mon,  8 Mar 2021 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615217593;
        bh=a0+1uZ6MI+rUazlW6IRSmCcz3df1yEE+4007pOdUess=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=aXMfXPOgEpyl9wN6d7jhFfcYu965UHhN5kSfnjGz8wdRfVwybcyTS5E19/zPdDILF
         P68qUSc8x4+fNe88cw9AnROwun6LCjnQGD8UNG5xIseVtkrHG76e5dSkpyCUgjl4tD
         BqbCM+OJfqDcl+hBrstM6hdVIC84U5CggbKcQuLJNxCNax4YxwQpCkotphLd6gJvtk
         tt1+5I+CEVbupkAz6Zr1aPvU7eiqT7XldFLucjoZBROSrKSiAe1wZkGqXMgaAm11fM
         S13igphAceLJGj0V/r/zHtF4qqJzIpL8FRqzZMJ5FCLIOpCYoj3G/xC9JZ3KqLzadz
         KXTL9WI93WxZg==
Date:   Mon, 8 Mar 2021 16:33:10 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Nehal Shah <nehal-bakulchandra.shah@amd.com>,
        Sandeep Singh <sandeep.singh@amd.com>,
        Richard Neumann <mail@richard-neumann.de>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/3] AMD_SFH: Allow overriding sensor-mask by module-param
 or DMI-quirk
In-Reply-To: <20210128121219.6381-1-hdegoede@redhat.com>
Message-ID: <nycvar.YFH.7.76.2103081633000.12405@cbobk.fhfr.pm>
References: <20210128121219.6381-1-hdegoede@redhat.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 28 Jan 2021, Hans de Goede wrote:

> Hi All,
> 
> There are several bug-reports about the new AMD_SFH driver not working
> on various HP ENVY x360 Convertible models. The problem is that the
> driver expects the BIOS to program which sensors are present into the
> active bits of the AMD_P2C_MSG3 register; and the BIOS on these models
> does not do this:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=199715
> https://bugzilla.redhat.com/show_bug.cgi?id=1651886
> 
> This patch-set adds a module-parameter + DMI-quirk mechanism to override
> the settings read back from the AMD_P2C_MSG3 register, to work around
> this problem. The DMI-quirk table is populated with 2 HP ENVY x360
> Convertible models which are know to need this workaround.

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

