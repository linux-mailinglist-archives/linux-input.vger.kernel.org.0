Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D406A30407D
	for <lists+linux-input@lfdr.de>; Tue, 26 Jan 2021 15:37:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405859AbhAZOgT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 26 Jan 2021 09:36:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:42136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388435AbhAZNZj (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 26 Jan 2021 08:25:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36C4020729;
        Tue, 26 Jan 2021 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611667498;
        bh=dGQ0P3djUtlmnwebSp5Hv7ctzDwEAgpJXOlCTuw+L24=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=CTqGxnRpew+/jYVCY6rBqB/ZJ+PtT9a7Xy2bMFoFqRUQ1U+x09YS9VNKjA1ots83x
         S+31zrKfiF9zDfiphSOO32OiQz+159x4lGkP3qC0fKZb3wlRNi3C9AV2muz1q0IuR3
         jTvnHSQWHvURgIyUCyg++BvGbHgIC8zygH2+lwBPstV9V9FFnsOAnuyS83heX7WziF
         BWR8KS2GSUO+AGIrJFc+9haYGRuTrAlFbKt6C+MXo6sRtDo4Kx8AaAi4AlJEddbCeb
         nPmLIsXjsOFoPpvh8MHeNmH1eLjA8TMRYkh+IgCyuaOaDCp6dn1zUmGP39Yuj54XNU
         YU5pr2BKpbqOQ==
Date:   Tue, 26 Jan 2021 14:24:55 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Randy Dunlap <rdunlap@infradead.org>
cc:     linux-kernel@vger.kernel.org,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH 0/2 v2] HID: fix some kernel-doc notations
In-Reply-To: <20210119200723.12092-1-rdunlap@infradead.org>
Message-ID: <nycvar.YFH.7.76.2101261424460.5622@cbobk.fhfr.pm>
References: <20210119200723.12092-1-rdunlap@infradead.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 19 Jan 2021, Randy Dunlap wrote:

> Clean up kernel-doc notation in 2 <linux/hid*.h> files
> and in drivers/hid/hid-quirks.c.
> 
> Cc: Jiri Kosina <jikos@kernel.org>
> Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Cc: linux-input@vger.kernel.org
> 
> rebase & resend:
> [PATCH 1/2 v2] HID: correct kernel-doc notation in <linux/hid*.h>
> [PATCH 2/2 v2] HID: correct kernel-doc notation in hid-quirks.c

Applied, thanks Randy.

-- 
Jiri Kosina
SUSE Labs

