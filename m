Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49CCA8196D
	for <lists+linux-input@lfdr.de>; Mon,  5 Aug 2019 14:38:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbfHEMiL (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 5 Aug 2019 08:38:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:60530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728793AbfHEMiK (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 5 Aug 2019 08:38:10 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4591E2067D;
        Mon,  5 Aug 2019 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565008690;
        bh=BUB5G78uORK09bNVqnktRpi2y/1IiEfTb9E8k/FO1bE=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=0Ngxu0+flwi3j9v61vccmmt/RSnHJRJIyfCj76d0rRjdj/GCfhUTjSXMAijH1lSR/
         TIeunmNLiEozRRyhkCDrWTjoRZHOTZ9+uPUZf4o53V/+uX1NNiw/TbRmkurc0/D6L2
         C/AiTXNzdKbpVbCPM1L8c5w3bqdbcIGl3YPfFgnc=
Date:   Mon, 5 Aug 2019 14:38:06 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        dmitry.torokhov@gmail.com, wbauer@tmo.at,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] HID: input: fix a4tech horizontal wheel custom
 usage
In-Reply-To: <cd69abeb3883ff7c7e2ff8dbe4db722f4e981875.camel@suse.de>
Message-ID: <nycvar.YFH.7.76.1908051437490.5899@cbobk.fhfr.pm>
References: <20190611121320.30267-1-nsaenzjulienne@suse.de> <cd69abeb3883ff7c7e2ff8dbe4db722f4e981875.camel@suse.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 1 Aug 2019, Nicolas Saenz Julienne wrote:

> > Some a4tech mice use the 'GenericDesktop.00b8' usage to inform whether
> > the previous wheel report was horizontal or vertical. Before
> > c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key") this
> > usage was being mapped to 'Relative.Misc'. After the patch it's simply
> > ignored (usage->type == 0 & usage->code == 0). Which ultimately makes
> > hid-a4tech ignore the WHEEL/HWHEEL selection event, as it has no
> > usage->type.
> > 
> > We shouldn't rely on a mapping for that usage as it's nonstandard and
> > doesn't really map to an input event. So we bypass the mapping and make
> > sure the custom event handling properly handles both reports.
> > 
> > Fixes: c01908a14bf73 ("HID: input: add mapping for "Toggle Display" key")
> > Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> > ---
> 
> It would be nice for this patch not to get lost. It fixes issues both repoted
> on opensuse and fedora.

Sorry for the delay. I've now queued the patch. Thanks for fixing this,

-- 
Jiri Kosina
SUSE Labs

