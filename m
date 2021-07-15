Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 776193CA7F4
	for <lists+linux-input@lfdr.de>; Thu, 15 Jul 2021 20:54:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241350AbhGOS5Q (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 15 Jul 2021 14:57:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:32942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242071AbhGOS4s (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Thu, 15 Jul 2021 14:56:48 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0EA8A613CC;
        Thu, 15 Jul 2021 18:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626375235;
        bh=pQlmsw5zGtMZ6o2KG+Z4LY6W600ov5/ynMNtRf6FIo4=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=QOjslq6eJRhkQnCIw0tR9LOVKr5CP9AmTHR+j04r6H5tZVYPGz40MbJE+jnG8Cx6y
         RmdDqQAmLv/k2JHHy2UCLbzhuVz+4g3o3WQqjBrrYG0YhkvvgufVvSzecX1Nz6yqhv
         XkS9gpilUQRLlb+5x9+ntR0jgtNvyDFvbJAN1DX1Oe5cBJKZ9ysgwC+UimP3AjNDCn
         UuSzp12zBN5dbNV0spOekuGq86BQglttXjgpkgTxZBLXTG22wmGAmdjLMriJzfGOCv
         YylBgON3Dhg4MQ5Qbf8RduYoBdx7/jt5yXPC/oDG0XMfcDCV5BX88v7VW1vbVc4f0L
         wd6bhTbIVlwvA==
Date:   Thu, 15 Jul 2021 20:53:51 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Daniel J. Ogorchock" <djogorchock@gmail.com>
cc:     linux-input@vger.kernel.org, thunderbird2k@gmail.com,
        blaws05@gmail.com, benjamin.tissoires@redhat.com,
        Roderick.Colenbrander@sony.com, svv@google.com, s.jegen@gmail.com,
        carmueller@gmail.com, pgriffais@valvesoftware.com,
        hadess@hadess.net
Subject: Re: [PATCH v13 00/15] HID: nintendo
In-Reply-To: <20210520224715.680919-1-djogorchock@gmail.com>
Message-ID: <nycvar.YFH.7.76.2107152053100.8253@cbobk.fhfr.pm>
References: <20210520224715.680919-1-djogorchock@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 20 May 2021, Daniel J. Ogorchock wrote:

> I've neglected updating this for awhile. Not much has changed in this
> revision. It has a couple bug fixes caught in the prior rev in addition
> to altering how rumble is handled

I have gone through this series, and haven't found anything outstanding, 
so unless anyone voices any objections immediately, I am planning to queue 
it for 5.15.

Thanks,

-- 
Jiri Kosina
SUSE Labs

