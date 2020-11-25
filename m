Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC8E2C4120
	for <lists+linux-input@lfdr.de>; Wed, 25 Nov 2020 14:28:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727031AbgKYN2n (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 25 Nov 2020 08:28:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:55048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727626AbgKYN2m (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 25 Nov 2020 08:28:42 -0500
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59A29206F9;
        Wed, 25 Nov 2020 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606310922;
        bh=BWIcBkOWAUH61ONlvUQmCBuj4yUo0LQzAG/L5BK+EoY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=2wOZeWqdTZIbS+qRZOfOZcwGz/hZQlU1e8dH/hqAJzeU2lp2iUEEZdXkIH6l3Y68u
         POWKq/9qwp3+OSW5kga5s/46FwT1VDR+2FjM4vmcEoazmTzRrAkKOL8YPqkDF69COb
         dN02xR2eMu9FWp2UMuuW2LuAdRtiKSEo7taKFeLQ=
Date:   Wed, 25 Nov 2020 14:28:39 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     YOSHIOKA Takuma <lo48576@hard-wi.red>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: elecom: rewrite report based on model specific
 parameters
In-Reply-To: <20201121205438.4092-1-lo48576@hard-wi.red>
Message-ID: <nycvar.YFH.7.76.2011251428240.3441@cbobk.fhfr.pm>
References: <20201121205438.4092-1-lo48576@hard-wi.red>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 22 Nov 2020, YOSHIOKA Takuma wrote:

> The report descriptor for EX-G wireless mouse (M-XGL20DLBK) is a bit
> different from that for trackball mice such as DEFT. For such mouse, the
> current `mouse_button_fixup` cannot be used as is, because it uses
> hard-coded indices for a report descriptor.
> 
> Add parameters to `mouse_button_fixup` function, in order to support
> fixing report descriptors for more models.

I have applied both patches, thank you.

-- 
Jiri Kosina
SUSE Labs

