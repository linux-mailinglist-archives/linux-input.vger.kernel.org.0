Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C43920028E
	for <lists+linux-input@lfdr.de>; Fri, 19 Jun 2020 09:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgFSHOX (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 19 Jun 2020 03:14:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:52260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727916AbgFSHOX (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 19 Jun 2020 03:14:23 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DBAF02078D;
        Fri, 19 Jun 2020 07:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592550862;
        bh=Gzn/BOgh+f8yhPCtgel2ImQk7H6ikVzuBWKo+LwRf5U=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=wDxLDoOOlf9MdwGo14lwNbirQ2v29edpXnKIPULwwFauyrRdyR1D9Ggl6C2IxJzaC
         Zt5Fg9L+uf1Tj8dmfb5G90z+h3+5k0JgKwI0nM+/owTOX2rD6Tms8qsMk/mbtI9uhu
         ORNgWISd6eXwgurWQ7NcsUq6XlmyloqoLKI6k148=
Date:   Fri, 19 Jun 2020 09:14:19 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Cristian Klein <cristian.klein@elastisys.com>
cc:     benjamin.tissoires@redhat.com, linux-input@vger.kernel.org
Subject: Re: [PATCH] Allow building hid.ko as an "external" module
In-Reply-To: <20200518113742.21718-1-cristian.klein@elastisys.com>
Message-ID: <nycvar.YFH.7.76.2006190914070.13242@cbobk.fhfr.pm>
References: <20200518113742.21718-1-cristian.klein@elastisys.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 18 May 2020, Cristian Klein wrote:

> For quickly testing USB HID quirks with a larger community, it is useful
> to be able to build hid.ko as an external module, e.g., against the
> source code of the running kernel.
> 
> Before this patch this failed as follows:
> ```
> $ make -C /lib/modules/$(uname -r)/build M=$PWD/drivers/hid
> make: Entering directory '/usr/src/linux-headers-5.3.0-51-generic'
>   CC [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid-core.o
>   CC [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid-dmi-quirks.o
>   LD [M]  /home/cklein/linux/drivers/hid/i2c-hid/i2c-hid.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/init.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/hbm.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/client.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/bus.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/dma-if.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ishtp/client-buffers.o
>   LD [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/intel-ishtp.o
>   CC [M]  /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.o
> /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.c:12:10: fatal error: client.h: No such file or directory
>    12 | #include "client.h"
>       |          ^~~~~~~~~~
> compilation terminated.
> make[2]: *** [scripts/Makefile.build:290: /home/cklein/linux/drivers/hid/intel-ish-hid/ipc/ipc.o] Error 1
> make[1]: *** [scripts/Makefile.build:519: /home/cklein/linux/drivers/hid/intel-ish-hid] Error 2
> make: *** [Makefile:1656: _module_/home/cklein/linux/drivers/hid] Error 2
> make: Leaving directory '/usr/src/linux-headers-5.3.0-51-generic'
> ```

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

