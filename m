Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37410331046
	for <lists+linux-input@lfdr.de>; Mon,  8 Mar 2021 15:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhCHOA3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 09:00:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:38224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229729AbhCHOAZ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 8 Mar 2021 09:00:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4675465020;
        Mon,  8 Mar 2021 14:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615212025;
        bh=YQsm6KMDY0N2Ctv8oTPi/w8T765Y85DVcIBA2O4rkgI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=jbgwB8MZsoqJGgLXF+42i1tqc1EZxXlU5d+WZSC6d9BoPjDSm+PRHIW4Uj+YBa+MS
         eRwO8STv85Xgncrij0Jl/eK+RqSGdMprTd7+oxi4xrQPS0b/2EY5ZKh7lVkJE6LMQm
         0PKXriqNM3VxITopQSUMRjk4tLd7ckvAcP2DlvoExn/hbQPpgE6I10hi4ahB5EfxXW
         0vBVPD2e9a/hxixScx1C8CD/nwGMiTbx4H5AQdBQqKR1bhX68U0CRZ8lANVEobNcrh
         YPtqhqlTpjFEi37zGu7R0FA99VB4Kq8HG/yThhBvDitBNL6nVV7XBgvBlsSVj/vQR1
         CcuciHF8L/A9A==
Date:   Mon, 8 Mar 2021 15:00:22 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dario Pagani <dario.pagani.146@gmail.com>
cc:     linux-input@vger.kernel.org, kimi.h.kuparinen@gmail.com
Subject: Re: [PATCH] HID: support for initialization of some Thrustmaster
 wheels
In-Reply-To: <20210131090045.10636-1-dario.pagani.146@gmail.com>
Message-ID: <nycvar.YFH.7.76.2103081458550.12405@cbobk.fhfr.pm>
References: <20210131090045.10636-1-dario.pagani.146@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 31 Jan 2021, Dario Pagani wrote:

> Add support for proper initialization of some Thrustmaster wheels that
> appear like a "Thrustmaster FFB Wheel" (044f:b65d) to the host. When the
> device is connected a special usb request is sent, this request makes the
> wheel disconnect and reappear to the host as the "real wheel".
> For example: a T150 will re-appear as 044f:b677 and a T300 as 044f:b66e

Hi Dario,

thanks a lot for working on enabling these devices on Linux.

Two questions:

- I don't think we need to have this in a separate driver, is there a 
  substantial reason why it can't be folded into hid-thrustmaster proper?

- Looking at what the code actually does, it seems like this could 
  completely be done in userspace via libusb as a hook in udev when such 
  device is plugged in, can't it?

Thanks,

-- 
Jiri Kosina
SUSE Labs

