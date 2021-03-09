Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 787AF331B82
	for <lists+linux-input@lfdr.de>; Tue,  9 Mar 2021 01:16:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhCIAQW (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 8 Mar 2021 19:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbhCIAQE (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 8 Mar 2021 19:16:04 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B18FC06174A
        for <linux-input@vger.kernel.org>; Mon,  8 Mar 2021 16:16:04 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 701AD2B0;
        Tue,  9 Mar 2021 00:16:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 701AD2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615248963; bh=ggeA7+9EckBPgzh4E2U+ySMdWIT6GFjSMzjxGXsUDSg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SNTRE8NPG/vU+NuLRp2/s5MetXNdx258mnHlgc1INNEqFkvgGx2u85shlHniA9eUQ
         ANnNtdbUwyAzK503/7SgA6txF2AwHCoPp9+sMI7U5v7EYXbGLoY9mutj+UmyTcI6pg
         S7BN9BqJRKLabnPSJctpN36RqxgFkRAohmYi2spYlR8F547NrcGXoKXXuurLm39Bc7
         OqMjNRN9FHQEOLR4yjxH0vCZAs7A9/PU7LK4iZWMzsdtDAmufvhooPM3AKFaRe9ojg
         XypHgo6VA19DuTDePCiOPbUDDbrS4zD/4MwN9eMyT1LhY4oAhfzQsO8MqCntp6Izxn
         StRxi35tmmSbw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/8] input: Documentation: corrections to Doc/input/ files
In-Reply-To: <20210302223523.20130-1-rdunlap@infradead.org>
References: <20210302223523.20130-1-rdunlap@infradead.org>
Date:   Mon, 08 Mar 2021 17:16:02 -0700
Message-ID: <878s6x5ghp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Update several Documentation/input/ files for wording, punctutation,
> struct info, and file names.
>
> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> Cc: linux-input@vger.kernel.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
>
>  [PATCH 1/8] input: Documentation: corrections for input.rst
>  [PATCH 2/8] input: Documentation: corrections for event-codes.rst
>  [PATCH 3/8 RESEND] input: Documentation: update related file names in ff.rst
>  [PATCH 4/8] input: Documentation: corrections for gameport-programming.rst
>  [PATCH 5/8] input: Documentation: corrections for multi-touch-protocol.rst
>  [PATCH 6/8] input: Documentation: corrections for notifier.rst
>  [PATCH 7/8] input: Documentation: corrections for input-programming.rst
>  [PATCH 8/8] input: Documentation: corrections for uinput.rst
>
>  Documentation/input/event-codes.rst          |   10 ++--
>  Documentation/input/ff.rst                   |    6 +-
>  Documentation/input/gameport-programming.rst |   35 +++++++++++------
>  Documentation/input/input-programming.rst    |   20 ++++-----
>  Documentation/input/input.rst                |    8 +--
>  Documentation/input/multi-touch-protocol.rst |    8 +--
>  Documentation/input/notifier.rst             |    3 -
>  Documentation/input/uinput.rst               |    2 
>  8 files changed, 52 insertions(+), 40 deletions(-)

Set applied, thanks.

jon
