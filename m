Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 883AA756CE5
	for <lists+linux-input@lfdr.de>; Mon, 17 Jul 2023 21:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjGQTNv (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 17 Jul 2023 15:13:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjGQTNu (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 17 Jul 2023 15:13:50 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF49297
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:13:49 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b70bfc8db5so73138591fa.2
        for <linux-input@vger.kernel.org>; Mon, 17 Jul 2023 12:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689621228; x=1692213228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enAgyj9XiztQWLOHm+/rfFDQ5gLnsunt7hycMd8aLlI=;
        b=FDN7qa/QCax4LxfImFBBblopvgYEB4pgqa456gqcucC3iYWw9skw/LB77HaXAJiRq3
         ZzTGu2dl52Gd9zxxAWDSyvzAFPaeBv7XhiwjBFmrDrtpiq6lI0mVQKaGnVJnFI//LXKH
         mvWEMdeKk+DYg9PwABm1I5D9zfMrbHYhPYILQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689621228; x=1692213228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enAgyj9XiztQWLOHm+/rfFDQ5gLnsunt7hycMd8aLlI=;
        b=LikdFs595huCTlniTrX86JtMsWBCHrzSJx3s81s61apii7Or+EQh+5254uM1VYYWFu
         cwC+pwupXzMElpwWJYjXLDQoCBvrVeLcEDPFqaGgD4dSWDs19WN6zNmoEd5Zse9IXQ4U
         UhZP0uPdRcm7j+VE21OCOIsB9wceKLtMcuDajNFGEMSYMphK5z4VwroebSWpupLw/UgD
         2OiOFS59roCAXhO6ESPPIFyKk32NlnkLq+MRwXeKNJkiHFeuILoxshzh5kZjzAh/L83P
         abrFV0H4K7fLTimS3wiOvuN6CrJsFoUq6mgLpAyCfigqiycklmjR2ac+jh+bUcVetbKX
         Y86g==
X-Gm-Message-State: ABy/qLaLt+WMrME+tyYbRhCEiTZMBV2fH5P6gIrKFIzU9CNKZ+qudEnN
        69y7+dwVEA2gcjz6IF4exjRqq2dmZihcu//nxzLcuFAlgwuFrA3Ry0k=
X-Google-Smtp-Source: APBJJlHFznsr+UgGOeobpkVr5Y5ed8yqx1FRKVl40uJFQk6BbziWG6mnlECNR75v65aR/aNAo8f5KkYSAwvgOP9Rz98=
X-Received: by 2002:a2e:9c93:0:b0:2b6:e618:b593 with SMTP id
 x19-20020a2e9c93000000b002b6e618b593mr8935048lji.31.1689621228279; Mon, 17
 Jul 2023 12:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <CALNJtpUN+DrWtudWdKZxYMR7oM-yt926fj7_Wi9dUPLZybw-vQ@mail.gmail.com>
 <2023062959-agreeable-zipfile-df6b@gregkh> <CALNJtpX_SanxbjHhEAikkPBGde812hPNW0z5fTiuPZRTpK-CLg@mail.gmail.com>
 <2023070838-vacation-ferris-e486@gregkh>
In-Reply-To: <2023070838-vacation-ferris-e486@gregkh>
From:   Jonathan Denose <jdenose@chromium.org>
Date:   Mon, 17 Jul 2023 14:13:37 -0500
Message-ID: <CALNJtpU8AnWDybNXxWfWwN2EbieJBJmQqsDMb_7hjG7c7OCOsQ@mail.gmail.com>
Subject: Re: Touchpad lost sync at byte 6
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Is linux-input@vger.kernel.org not also the input driver maintainers
list? When I run get_maintainers.pl on the mouse driver files it gives
me only this list and then some personal emails of some maintainers.

I think I may have forgotten to reply-all earlier in the thread so the
list wasn't cc'd on all of the emails.

On Sat, Jul 8, 2023 at 8:10=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jul 07, 2023 at 10:42:06AM -0500, Jonathan Denose wrote:
> > Hi Greg,
> >
> > Thanks for your reply.
> >
> > I have tried the 6.4 and 6.1 kernels and the issue is still present.
> > I've tried on 5.10 as well.
> >
> > I'm suspecting that this may have not worked on this hardware with any
> > kernel version. Where should I go from here?
>
> Contact the input driver maintainers on their list and work on the issue
> there.
>
> good luck!
>
> greg k-h
