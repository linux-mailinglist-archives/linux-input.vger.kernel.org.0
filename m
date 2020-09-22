Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F0D273E58
	for <lists+linux-input@lfdr.de>; Tue, 22 Sep 2020 11:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgIVJQ7 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 22 Sep 2020 05:16:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:35410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726627AbgIVJQ7 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 22 Sep 2020 05:16:59 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D739A2075E;
        Tue, 22 Sep 2020 09:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600766218;
        bh=/qNykw9P1hkPLZ7BGgDNtx9D92tn1ua/Mb2jUA9yNek=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=cNdgaUxacaIdBGEElGxj0o/ZygTWBwcijGegTBzUYvYCXb50qdm/6DVXoIPwsS21h
         Bowxjzx/aLI6+Ul6ZuTVT5IkBnuznadvS1xeq63n9NiCE+sOyqXA6o72SOy2nROG5E
         OrJ3ouoAWGPqSPPolmUQOF8M/ntxDbAodlF95dd4=
Date:   Tue, 22 Sep 2020 11:16:55 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-15?Q?Mikael_Wikstr=F6m?= <leakim.wikstrom@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: multitouch: Lenovo X1 Tablet Gen3 trackpoint and
 buttons
In-Reply-To: <CADGsf-Gs9EM770jTVX=yABBLAT1rdfBYb5jam720yqez=D3VHg@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2009221115530.3336@cbobk.fhfr.pm>
References: <CADGsf-Gs9EM770jTVX=yABBLAT1rdfBYb5jam720yqez=D3VHg@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 19 Sep 2020, Mikael Wikström wrote:

> One more device that needs 40d5bb87 to resolve regression for the trackpoint
> and three mouse buttons on the type cover of the Lenovo X1 Tablet Gen3.
> 
> It is probably also needed for the Lenovo X1 Tablet Gen2 with PID 0x60a3
> 
> Signed-off-by: Mikael Wikström <leakim.wikstrom@gmail.com>

Thanks for the patch. Unfortunately it has been whitespace damaged by your 
client. Could you please fix that up (some help might be found in [1]) and 
resubmit?

Thanks.

[1] Documentation/process/email-clients.rst

-- 
Jiri Kosina
SUSE Labs

