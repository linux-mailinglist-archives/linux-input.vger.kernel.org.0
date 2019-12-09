Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4ED6116D54
	for <lists+linux-input@lfdr.de>; Mon,  9 Dec 2019 13:53:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbfLIMxT (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 9 Dec 2019 07:53:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:59196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726687AbfLIMxT (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 9 Dec 2019 07:53:19 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C01192077B;
        Mon,  9 Dec 2019 12:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575895998;
        bh=U4O5S5rduTkoz2GV1+PR+HzHG8x2XgOHHdNguUE9hoE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=PuGahGg+Kxhi1BtiiL+cBFKGmrXbgDJx3hB3Idx5s1FkWMN3O147lxKPBnRf97WvQ
         pcMVDohclVKLlvNb8bzLWaOAXVARR5aXaA4w9tkYL1Q8kjjtLIHPEKaXhnHSxRHW3E
         lBSdMSXQPHDL/D72y1e6CwltG3ds8XMxk33M0j04=
Date:   Mon, 9 Dec 2019 13:53:15 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Fabian Henneke <fabian.henneke@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hidraw: Fix returning EPOLLOUT from hidraw_poll
In-Reply-To: <20191204023713.3983-1-marcel@holtmann.org>
Message-ID: <nycvar.YFH.7.76.1912091353020.4603@cbobk.fhfr.pm>
References: <20191204023713.3983-1-marcel@holtmann.org>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 4 Dec 2019, Marcel Holtmann wrote:

> When polling a connected /dev/hidrawX device, it is useful to get the
> EPOLLOUT when writing is possible. Since writing is possible as soon as
> the device is connected, always return it.
> 
> Right now EPOLLOUT is only returned when there are also input reports
> are available. This works if devices start sending reports when
> connected, but some HID devices might need an output report first before
> sending any input reports. This change will allow using EPOLLOUT here as
> well.
> 
> Fixes: 378b80370aa1 ("hidraw: Return EPOLLOUT from hidraw_poll")
> Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
> Cc: stable@vger.kernel.org

Applied, thanks Marcel.

-- 
Jiri Kosina
SUSE Labs

