Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3F2C189F79
	for <lists+linux-input@lfdr.de>; Wed, 18 Mar 2020 16:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbgCRPSk (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 18 Mar 2020 11:18:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726619AbgCRPSk (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 18 Mar 2020 11:18:40 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D63FC20757;
        Wed, 18 Mar 2020 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584544719;
        bh=3ik3W4R/WOTCf/Ip5Ko5O1i7v7YMu4dBHBzNotGH174=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=fqmCjn6fxOtMF6p5X1Qb5e48PAabDtwuKZ+Klqnyyj6Ynfsm5PFCnPIzKA1LvhEEZ
         ixEQBg5rgTHkRA4VRoV4dpIBrrYZFrRFf8icV8ulyCEc40EKRGy+ZkLjBZxrj8C9Ue
         2KpWgiv/66IQmfVub0Kxjsm3azSHLIAlZldSkkrI=
Date:   Wed, 18 Mar 2020 16:18:36 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     =?ISO-8859-2?Q?Samuel_=C8avoj?= <sammko@sammserver.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Silvan Jegen <s.jegen@gmail.com>
Subject: Re: [PATCH v2] HID: Add driver fixing Glorious PC Gaming Race mouse
 report descriptor
In-Reply-To: <20200313021236.1069863-1-sammko@sammserver.com>
Message-ID: <nycvar.YFH.7.76.2003181618040.19500@cbobk.fhfr.pm>
References: <20200308212729.51336-1-sammko@sammserver.com> <20200313021236.1069863-1-sammko@sammserver.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 13 Mar 2020, Samuel Čavoj wrote:

> The Glorious Model O mice (and also at least the Model O-, which is
> driver-wise the same mouse) have a bug in the descriptor of HID
> Report with ID 2. This report is used for Consumer Control buttons,
> which can be mapped using the provided Windows only software.
> 
> Here is an excerpt from the original descriptor:
> 
>   INPUT(2)[INPUT]
>     Field(0)
>       Flags( Constant Variable Absolute )
>     Field(1)
>       Flags( Constant Variable Absolute )
>     Field(2)
>       Flags( Constant Variable Absolute )

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

