Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE5A515052B
	for <lists+linux-input@lfdr.de>; Mon,  3 Feb 2020 12:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgBCLXA (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 3 Feb 2020 06:23:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:38038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727072AbgBCLXA (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 3 Feb 2020 06:23:00 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9634520661;
        Mon,  3 Feb 2020 11:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580728979;
        bh=WY0s7CN0cRyL7YAzy6I+2wLOmNOSlFcDEdOTX5DsXQo=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=lFWqV0iyfR38dTxTBMIlOpp7DbA7K5zpiYTYRj4S6gswkt1Vm32AMbEOqPg2dqrlU
         P54iRjfhhQ5N7UIYdt6CViMsnOsoyX2XDVUvheZPBhl+5Z1XtxKa0zUWFZ3zBBhbBX
         ip5En1032rGXQpqCOHP4ya/++Ea0w+JxYmh4fB0Q=
Date:   Mon, 3 Feb 2020 12:22:42 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>
cc:     Roderick Colenbrander <thunderbird2k@gmail.com>,
        Martyn Welch <martyn@welchs.me.uk>,
        linux-input <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Conn O'Griofa <connogriofa@gmail.com>,
        "Colenbrander, Roelof" <roderick.colenbrander@sony.com>
Subject: Re: [PATCH] HID: Sony: Add support for Gasia controllers
In-Reply-To: <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2002031218230.26888@cbobk.fhfr.pm>
References: <20200126194513.6359-1-martyn@welchs.me.uk> <CAEc3jaDjVZF_Z7Guj1YUo5J5C_-GEOYTH=LKARKccCwQAwuZnQ@mail.gmail.com> <fb8850c6c1766b4360a69419845aa8bf7a3aa7a6.camel@welchs.me.uk> <CAEc3jaB9ubRLJJG9eWL8-QnEU1s-6cOYsY-PKd57e_K9BiPkSA@mail.gmail.com>
 <nycvar.YFH.7.76.2002031100500.31058@cbobk.fhfr.pm> <CAO-hwJ+k8fxULS1xC-28jHmhZLZVN5EGc=kY5sqNX1GCNKpt4A@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 3 Feb 2020, Benjamin Tissoires wrote:

> I am definitely not in favour of that :(
> 
> The basic problem we have here is that some vendors are overriding your 
> VID/PIDs, and this is nasty. And I do not see any reasons why you can't 
> say: "well, we broke it, sorry, but we only support *our* devices, not 
> third party ones".

Well, it's not about "we broke it" in the first place, as far as I 
can tell.

Roderick's concern is that 3rd party devices with overriden VID/PID 
malfunction for completely unrelated reason to (correctly working) changes 
done in favor of stock Sony devices, but it'll be Sony receiving all the 
reports/blame.

> One thing that comes to my mind (probably not the best solution), is to 
> taint the kernel if you are facing a non genuine product. We do that for 
> nvidia, and basically, we can say: "well, supporting the nvidia blob is 
> done on a best effort case, and see with them directly if you have an 
> issue". Tainting the kernel is a little bit rough, but maybe adding an 
> info message in the dmesg if you detect one of those can lead to a 
> situation were we can count on you for supporting the official products, 
> and you can get community support for the clones.

Yeah; which I wouldn't like to do for upstream kernel, but Sony could 
definitely do this for the products they ship.

The same way distros are tainting their kernels when unsupported modules 
(but otherwise perfectly fine wrt. GPL and everything else) are loaded 
into distro-supported kernels.

> One last thing. Roderick, I am not sure if I mentioned that or not, but 
> I am heavily adding regression tests for HID in 
> https://gitlab.freedesktop.org/libevdev/hid-tools/

... and words can't express how thankful I am for that :)

Thanks,

-- 
Jiri Kosina
SUSE Labs

