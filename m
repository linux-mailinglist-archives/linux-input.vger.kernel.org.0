Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5573A8901
	for <lists+linux-input@lfdr.de>; Tue, 15 Jun 2021 20:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhFOTAF (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Jun 2021 15:00:05 -0400
Received: from mx.ucr.edu ([138.23.62.67]:16377 "EHLO mx5.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229749AbhFOTAE (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Jun 2021 15:00:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1623783481; x=1655319481;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=XCTfmrWHzE5N1215OOpIYMgsouXngQwcMQaEg3Gkd90=;
  b=L8v6NbLUD7wgvnlyk4vRvorvVNPYcH3huu0sEf0o2Gq6PA3FEgL7JbIp
   R1W+fcoC79QJNfO/2JNgabTLxpvrUNVgjiaZKWyYVlo8wY05Bn+O267X2
   GfqWZWUUiLU1hJfsjJQQiQZkFiaiJTfggNm05pVYyEJIEuweJ0VRV4e8O
   E7pyEowrzeEy+wH339+i7vJU9EPPEbbawyKtLaECni57WVYC9bRf5P6TS
   Ef/L+KX/fClZXzLaFduejPOXkygiUmkklwVkHuNQxcnjDRuzqq04Fymun
   6VBQpcF2QdkWZ7xqlMsK3B4umOo5qJvmOE4ftMHcAfPkk3MnpMCqSVLQy
   w==;
IronPort-SDR: iG3COP99uvigrG2RsuEYw8Fum3WuSQ86MGTmDMQJcP3x0ob2q0n6yEKt0llFxRUN6ZOHh7vGP1
 6zaKgHj+xMW5NxlL0TiCgHY+ml4qDtS3LzEUy/szFACPMnW2yZs8oIr6GCeC4xLkJlroaduvjs
 KIZqsNz71AKLTRqdI4KODcoWVqUB8IHO4ORd3yC/aRtnQe3RLpZU2F20V95bFKAR9rVdSy7SAa
 2r58E3y44VvbM92sTjQn5F+hG0xF2svbLwkUDlnTab4m+P+f/fUBSFkriTG/pgbGIE44aLEZLF
 SvY=
X-IPAS-Result: =?us-ascii?q?A2FxAgDk98hgf0XYVdFagQmBV4F8gXxshEiSBAOKS4s8h?=
 =?us-ascii?q?T+BfAIJAQEBD0EEAQGEUAKCaQIlNAkOAgQBAQEBAwIDAQEBAQUBAQYBAQEBA?=
 =?us-ascii?q?QEFBAEBAhABAW6FL0aCOCkBg20BAQEDEhFWEAsLDQICJgICIQESAQUBHAYTI?=
 =?us-ascii?q?oJPglYDLwWcWIEEPYsygTKBAYdODUwBCQ2BYhJ+KocJhmEngimBS4I3Nj6CI?=
 =?us-ascii?q?IFrg1CCZASCLFsSAXoTW4MbAQEBnjOaUoE0WgEGAoMDG5IShgyFWiulZi2GM?=
 =?us-ascii?q?540lQ0QI4ExghUzGiV/BmeBS1AZDo4rFoECAQiNQSQvOAIGCgEBAwmHFYJHA?=
 =?us-ascii?q?QE?=
IronPort-PHdr: A9a23:giaU4RHb12qjAC3A8kjZjp1GfzFMhN3EVzX9CrIZgr5DOp6u447ld
 BSGo6k03RmSB9qQtKkMotGVmpioYXYH75eFvSJKW713fDhBt/8rmRc9CtWOE0zxIa2iRSU7G
 MNfSA0tpCnjYgBaF8nkelLdvGC54yIMFRXjLwp1Ifn+FpLPg8it2O2+5pnebx9GiTajY75+I
 xe7oAvMvcQKnIVuLbo8xAHUqXVSYeRWwm1oJVOXnxni48q74YBu/SdNtf8/7sBMSar1cbg2Q
 rxeFzQmLns65Nb3uhnZTAuA/WUTX2MLmRdVGQfF7RX6XpDssivms+d2xSeXMdHqQb0yRD+v9
 LlgRgP2hygbNj456GDXhdJ2jKJHuxKquhhzz5fJbI2JKPZye6XQds4YS2VcRMZcTyNOAo2+Y
 IUPAeQPPvtWoZfhqFYVsRuyGROhCP/zxjNUhHL727Ax3eQ7EQHB2QwtB9ABsHXVrdX1KacSV
 v2+w6rIzTrZbvNdxDDw6YjJcxAhu/6MXK58fdbfxEQ0CgPKkk+QpZb7MDyIy+QAqm6W5PdvW
 uyzkWAosR1xoiSxycc2jInEno0Yx1TA+Ch5zog5O9K1RUp0b9OnH5ZduSGXOoVqT84jX2xlu
 Sg3x74btZOmYSQHy4oqyhDQZvGEboWG7A/uWfqXLDxlh3xlYKqyiwiu/UWk0OHxVcm53ExUo
 iZYk9TArHEA2hjV58OaUPVy5F2h1iyK1w3L7+FEJl07mrTDJp46x74wioITsUPeHi/qgEn2j
 LGZdkEj+uWw7uToeLTmppuFO49siAHyL70imsK+DOk8KAQOUG+b+eOz1L3n40L1WqlFjvozk
 qXBsZDaI9oUprKhDgNLzoou7wyzAjSm3dgCg3ULMVNIdAiGgoXtI13OJer3Dfa7g1Siijdrw
 PXGM6XhA5TMLnjMirbhcaph50NS0wcz0MxQ54hOBr4fPf3zR1f9tMbEAR8hLwy03+HnBc151
 oMfX2KPH6CYPLrTsV+O/uIvPvWMaZQLuDbyNfcl/eTijXwnll8He6mmw58XZGq/HvR8LEXKK
 Ubr1/sEEHsQr0ICS/bti12FT3YHa3OzQ7gtoC08EoWlDYDdbo+oib2Fmiy8G8sFSHpBDwW9E
 GXoaoLMafcFaWrGM91hmz1cDeOJVoQ7kxyiqVmpmPJcMuPI93hA5trY399v6riWzElqnQE=
IronPort-HdrOrdr: A9a23:XQh+8qAirAckyinlHemX55DYdb4zR+YMi2TDGXoBMCC9E/bo7/
 xG885rsCMc5AxhOk3I3OrwW5VoIkm8yXcW2/h0AV7KZmCP01dAbrsD0WKI+UyGJ8SRzJ866U
 6iScVD4R/LZ2SSQfyU3OBwKbpP/OW6
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,276,1616482800"; 
   d="scan'208";a="220179906"
Received: from mail-pj1-f69.google.com ([209.85.216.69])
  by smtpmx5.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 Jun 2021 11:57:49 -0700
Received: by mail-pj1-f69.google.com with SMTP id o11-20020a17090a420bb029016eed2aa304so188928pjg.2
        for <linux-input@vger.kernel.org>; Tue, 15 Jun 2021 11:57:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1m4IeEEent5jiHTe7biC0dGHPFqJqU242gYSqFmhd2U=;
        b=R2OZT4GlIxUK1NpKi1vPFjv45kD37a/9skhfs32sq3QU7hlTsopxa4EdU0weVfvnzP
         mNzOnYrNImeH2YIBfp+J1kK0RgK9mmluFkBdUody8EFDO14b4OIGSsRvzpVdsuWwWkO9
         jovxkU/GgQ7peI0cRiG9mB9aDIIfzpzCov0R5cJbMmIBnvGq6GZxII7uPuDRiDIOsNG6
         h64BqpzpcbUmQgwO1/Z+ZazEZCZIUWOkTqiQmwFBYyF98YvYFXVKWMy2k1UAuFVEOAFI
         CYZvU2Ds4v9FBt0JaYw6jDS8KDKV5QENOHbHX7EtpiemtUFuaP0ve5h0hQvIRa4uy1hA
         mUlA==
X-Gm-Message-State: AOAM533BkidSBzKe5D5WV2M/zbxosM2Ez9ZeOTUtrCsSM7/Zh9HUv241
        Ud3hlOUiF/9vTe9QbMbyRwiBBP+eIG5YbouAH55cy9hx+daFyZ2p0kA2mqVqhil85ngBTAjN3Ez
        /yY1E51T7UlvOc9ah69rYRI8BrRIw/6yBZf56NFhD
X-Received: by 2002:a17:902:222:b029:11b:9cea:eea9 with SMTP id 31-20020a1709020222b029011b9ceaeea9mr5569410plc.11.1623783467793;
        Tue, 15 Jun 2021 11:57:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnkTPSM9O0evxxWoz2GwOJYtWkZDnGaLYRNeodg7FZ/Jmq190oka8F/MupXXIe3Jw4+gwacghDUcgcgzpBqmY=
X-Received: by 2002:a17:902:222:b029:11b:9cea:eea9 with SMTP id
 31-20020a1709020222b029011b9ceaeea9mr5569385plc.11.1623783467440; Tue, 15 Jun
 2021 11:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <CABvMjLRuGPgEJ3Ef7=sBk3m3oa+3HuyV9mVY0ZCYuHK=rJRA4w@mail.gmail.com>
 <YMjuPtKtiaVLLO0q@google.com>
In-Reply-To: <YMjuPtKtiaVLLO0q@google.com>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Tue, 15 Jun 2021 11:57:36 -0700
Message-ID: <CABvMjLSKe2ojoVTZOwv_Dr4P4rsDa334vBc_-T8sMTPUJ-f==g@mail.gmail.com>
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in hideep_nvm_unlock()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Demitry:

Thanks for your quick response, following your advice, a careful way
is changing the return type of  "hideep_nvm_unlock()" from void to
int, and its caller "hideep_program_nvm()" also needs to add the
return check.

If this sounds ok, I would go ahead to modify the patch accordingly.

On Tue, Jun 15, 2021 at 11:15 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Yizhuo,
>
> On Tue, Jun 15, 2021 at 10:26:09AM -0700, Yizhuo Zhai wrote:
> > Inside function hideep_nvm_unlock(), variable "unmask_code" could
> > be uninitialized if hideep_pgm_r_reg() returns error, however, it
> > is used in the later if statement after an "and" operation, which
> > is potentially unsafe.
>
> I do not think that simply initializing the variable makes the code
> behave any better. If we want to fix this properly we need to check for
> errors returned by hideep_pgm_r_reg() and hideep_pgm_w_reg() and exit
> this function early, signalling the caller about errors.
>
> >
> > Signed-off-by: Yizhuo <yzhai003@ucr.edu>
> > ---
> >  drivers/input/touchscreen/hideep.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/input/touchscreen/hideep.c
> > b/drivers/input/touchscreen/hideep.c
> > index ddad4a82a5e5..49b713ad4384 100644
> > --- a/drivers/input/touchscreen/hideep.c
> > +++ b/drivers/input/touchscreen/hideep.c
> > @@ -363,7 +363,7 @@ static int hideep_enter_pgm(struct hideep_ts *ts)
> >
> >  static void hideep_nvm_unlock(struct hideep_ts *ts)
> >  {
> > -       u32 unmask_code;
> > +       u32 unmask_code = 0;
> >
> >         hideep_pgm_w_reg(ts, HIDEEP_FLASH_CFG, HIDEEP_NVM_SFR_RPAGE);
> >         hideep_pgm_r_reg(ts, 0x0000000C, &unmask_code);
> > --
> > 2.17.1
>
> Thanks.
>
> --
> Dmitry



-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
