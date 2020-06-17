Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D2B1FD236
	for <lists+linux-input@lfdr.de>; Wed, 17 Jun 2020 18:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgFQQbj (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 17 Jun 2020 12:31:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:58156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726761AbgFQQbi (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 17 Jun 2020 12:31:38 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F6A0206E2;
        Wed, 17 Jun 2020 16:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592411498;
        bh=om1XvWr8z+/X4DOkOJZ3g2sVTva0p9ASDNjWkJl84Mw=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=NM/iBc+m80pJ3sccQZfc0LJBMJbCoCnMRmsiFs9aDJoZi4JtAUuoT0PQzvYt5RLqF
         fTZPe9Av4ap+MbBknmwUdFj+md5TmGu9hLFEW6pgJYSqka6gWvEkDpE9FLBlFytMbi
         2BD6u8TlAOa12DblkYjzw6nMgdgyDJbEpI4zlLOM=
Date:   Wed, 17 Jun 2020 18:31:35 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Caiyuan Xie <caiyuan.xie@cn.alps.com>
cc:     Caiyuan Xie <shirleyxcy@gmail.com>,
        "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: =?GB2312?Q?Re=3A_=BB=D8=B8=B4=3A_=5BPATCH=5D_add_alps_devices?=
 =?GB2312?Q?_to_the_hid-ids=2Eh?=
In-Reply-To: <OSBPR01MB37662B2DBBD8261763E4820CAA9A0@OSBPR01MB3766.jpnprd01.prod.outlook.com>
Message-ID: <nycvar.YFH.7.76.2006171830560.13242@cbobk.fhfr.pm>
References: <20200522090937.5917-1-Shirleyxcy@gmail.com> <nycvar.YFH.7.76.2006161732010.13242@cbobk.fhfr.pm> <OSBPR01MB37662B2DBBD8261763E4820CAA9A0@OSBPR01MB3766.jpnprd01.prod.outlook.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Wed, 17 Jun 2020, Caiyuan Xie wrote:

> Thanks for your check. We will need to support those device IDs in 
> future, so we added them for future use.

Please add them once you have code making actual use of them in the 
driver, otherwise it's a bit pointless to maintain such unused list in the 
kernel headers.

Thanks again,

-- 
Jiri Kosina
SUSE Labs

