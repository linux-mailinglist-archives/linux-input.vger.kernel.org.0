Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3F684467E2
	for <lists+linux-input@lfdr.de>; Fri,  5 Nov 2021 18:27:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbhKERa0 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 5 Nov 2021 13:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhKERaZ (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 5 Nov 2021 13:30:25 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D76FFC061714;
        Fri,  5 Nov 2021 10:27:45 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 133so7685406wme.0;
        Fri, 05 Nov 2021 10:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=rk30KtS19Hr1jWGCg1z0hAjvJQZ3OGvu+1uH/cnLg58=;
        b=PO7R9d23qwS7/f4zOPrCa6HSwZZl6wCaRC3DWvhgZ30eEzWnaS0hA5EpNt1u3i8Cx4
         dbSIaGqz4w4wLYdy3230vbXfErsugosgfI3IfWmu16YukjcU+PzEkBCqmzed/NekYuKY
         mH8bWfjAlrkxYifww/6DObo+NVuSj8Tpyih2INmXlqhcJ8s8pdzP9jM9BYDHtsBJ47HY
         TE+ehPtDL+afoMynEWwk7bysjvf+IO3Cyi9NPEBEmgAqpHSgVxCdSDLC1TEqiBTrVts6
         j9BuBc7ajPe2pqDwVpidFyzuiFoq6jHsxUFU81N58RjGAkueL0KRGQBO80VzEXSElO/Y
         u0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=rk30KtS19Hr1jWGCg1z0hAjvJQZ3OGvu+1uH/cnLg58=;
        b=fbaYFCbzNb0s365369SNYW9F0AYcwnuPes+IpE1hCBl7LDarqiskwA4RFYn1JdsBwV
         DWYBpH8NE5dVujw8uSJQdZ4ihgLwMP2M9c7U8kwq4A9b8ldJkzml4guEmMnH1iABso16
         tUFwBsGgs1afa3W5na5ovHu9Pr43ufMhdThkzDtWXNJZD8vHl0rVtHfhAEhMsRenGEcw
         YGNHhxuJkyB0OYGcRyIRJp19YZNUvd04kBbY+fSWyYgcfge/2S2lcL6BJgLSGpqYlLGt
         MlAJWQzmZqHHLM+Epqw0BXIoPHiGY1uojxB0kBNZO9J6Cl2/lSQIsVUhdFhfh7AnfwBu
         xSSA==
X-Gm-Message-State: AOAM5337wU2ZK6TGGG5k9Ts9lC+4D3B6POlVU/atf57/AOSChoqXToLZ
        58HSVIpQqNQr2BZ/5rWHPtE=
X-Google-Smtp-Source: ABdhPJwS6UW2koakrpBVcBzrD/W0EcgWKhBz/Q2KmWIxv8ansAVyohH11Uum5Hah1BO5oIwp0N8B9w==
X-Received: by 2002:a05:600c:3ba3:: with SMTP id n35mr26703463wms.88.1636133264497;
        Fri, 05 Nov 2021 10:27:44 -0700 (PDT)
Received: from localhost (eduroam-113039.grenet.fr. [130.190.113.39])
        by smtp.gmail.com with ESMTPSA id p12sm10287241wrr.10.2021.11.05.10.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Nov 2021 10:27:44 -0700 (PDT)
Date:   Fri, 5 Nov 2021 18:27:01 +0100
From:   =?utf-8?Q?Fran=C3=A7ois-Xavier?= Carton <fx.carton91@gmail.com>
To:     Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
Cc:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
Subject: Re: [PATCH v3 0/4] HID: wiiu-drc: Add a driver for the Wii U gamepad
Message-ID: <YYVpZWuil2aTnROx@reblochon>
Mail-Followup-To: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
        Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        Ash Logan <ash@heyquark.com>,
        Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
        =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org,
        "Daniel J. Ogorchock" <djogorchock@gmail.com>
References: <20210502232836.26134-1-linkmauve@linkmauve.fr>
 <20210519085924.1636-1-linkmauve@linkmauve.fr>
 <20210921150837.ingexwsauvxgluca@luna>
 <nycvar.YFH.7.76.2110191112490.12554@cbobk.fhfr.pm>
 <20211019092737.kudgdeulghx2ig3m@luna>
 <nycvar.YFH.7.76.2110191128540.12554@cbobk.fhfr.pm>
 <20211104112137.n3q7vy23z3dztmn5@luna>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211104112137.n3q7vy23z3dztmn5@luna>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Nov 04, 2021 at 12:21:37PM +0100, Emmanuel Gil Peyrot wrote:
> On Tue, Oct 19, 2021 at 11:30:06AM +0200, Jiri Kosina wrote:
> > On Tue, 19 Oct 2021, Emmanuel Gil Peyrot wrote:
> […]
> > > Another driver I’d like to submit eventually is the GameCube Controller 
> > > Adapter for Wii U, which does exactly what its name says, but being an 
> > > external USB adapter it also works on any USB computer; would it make 
> > > sense to develop it alongside the current driver, just because it is 
> > > sold by the same company?
> > 
> > We generally group the support for HID devices in drivers based on the 
> > producing company, with a few exceptions where it doesn't make sense.
> 
> Speaking of which, would you want me to also merge hid-wiimote into
> hid-nintendo?  Or is there a reason it is separate besides legacy?
> 

Would naming the drivers with a "nintendo-" prefix while keeping them
separate be an acceptable solution? Since these drivers share no common
code, merging them will result in a big driver with different parts for
unrelated hardware (save for the maker company), which doesn't seem
right.

For the gamecube adapter driver, I'd prefer to keep it separate; but
I'll integrate it to hid-nintendo as Emmanuel did for the wii-u if
that's the preferred option.
