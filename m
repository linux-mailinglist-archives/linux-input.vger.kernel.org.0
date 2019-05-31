Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D1331706
	for <lists+linux-input@lfdr.de>; Sat,  1 Jun 2019 00:15:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbfEaWPw (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 31 May 2019 18:15:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:59770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbfEaWPw (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 31 May 2019 18:15:52 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B032726FA9;
        Fri, 31 May 2019 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559340951;
        bh=RWApvAIvY1RThjF1i2LTG9eqcVS2NtirCE3seHJn4QY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=cBwtYK1mYEJERlI5L84YmpBbLIZwDLJajYrVDqkrnzAhTyne2sZFJIIl4geDCoCo1
         NcZCPABTbrkuLWZieiFiqaCL2pznFrAUhZsxzcMB6lYobyGmt+q+OoYfPxvIrFO18z
         hom9g9IvfUarwHWZ6GTpkIbqV2EgdSttM3TKw64Q=
Date:   Sat, 1 Jun 2019 00:15:48 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dave Hansen <dave.hansen@intel.com>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: hid-related 5.2-rc1 boot hang
In-Reply-To: <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com>
Message-ID: <nycvar.YFH.7.76.1906010014150.1962@cbobk.fhfr.pm>
References: <2c1684f6-9def-93dc-54ab-888142fd5e71@intel.com> <nycvar.YFH.7.76.1905281913140.1962@cbobk.fhfr.pm> <CAO-hwJJzNAuFbdMVFZ4+h7J=bh6QHr_MioyK2yTV=M5R6CTm=A@mail.gmail.com> <8a17e6e2-b468-28fd-5b40-0c258ca7efa9@intel.com> <4689a737-6c40-b4ae-cc38-5df60318adce@redhat.com>
 <a349dfac-be58-93bd-e44c-080ed935ab06@intel.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 30 May 2019, Dave Hansen wrote:

> On 5/29/19 2:17 AM, Hans de Goede wrote:
> ...
> > Dave, can you try building your initrd without the hid-logitech-dj module
> > included in the initrd?
> 
> I did this on a vanilla 5.2-rc2 kernel (without the reverts) and still
> experienced the boot hang while the device was inserted.
> 
> > Also can you check if your modprobe is provided by module-init-tools
> > or by kmod ?
> 
> $ dpkg -S `which modprobe`
> kmod: /sbin/modprobe

Benjamin, Hans, are you looking into this?

If not, I think we should start reverting (at least the request_module() 
changes, not sure about the rest of logitech issues yet) next week.

Thanks,

-- 
Jiri Kosina
SUSE Labs

