Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF962DA816
	for <lists+linux-input@lfdr.de>; Tue, 15 Dec 2020 07:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbgLOG2o (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 15 Dec 2020 01:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgLOG2n (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 15 Dec 2020 01:28:43 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C64C06179C;
        Mon, 14 Dec 2020 22:28:03 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id s2so10434609plr.9;
        Mon, 14 Dec 2020 22:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KaZLnF6Ca13HKnEPZPec+JevKgSP4YCN0sRWZ+m6pyY=;
        b=k1oUbHHjew5YsIhi5W5+V9KHG5O+tngKHAsKxRHHdx4QMY9f4Svy0C8iwFsCbaxnbM
         hp7OZvVDN91hakcKi+PoooMSEAdkqRRP5riZsDu+/hUNo1avmK/dHR6cgqKsg3utzv1z
         kG2Vc4QWbXUW+J7gIU0Y8/Tzk/syMo5hw5kqes4q14yJ/bQXUxFj9+WZiQPhbemXfwaC
         eOxDsRuLeKfsqiV3Em5mSPxPSaGqkNeNTJrD71uELQ+TJXby7FtR7FkBtdXi42e29RDS
         lW33BDZsDuWvKrSPPeP/J1VUieOcKH94evl4KoMmt65BVFvnoFixMTUDZxLk/EJ8Bi+z
         i5Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KaZLnF6Ca13HKnEPZPec+JevKgSP4YCN0sRWZ+m6pyY=;
        b=ib/udhZ2eHEZx5Bb8rGyBy6U2Mm/k/++17kjPd5w95DOyb2YHGJGNKaszWhsqNdlEO
         GTazXBxTuF7QRjN8g+rUVDxSYoJs1Dlu5jZUSmmIeEcgs9rn4RcD4aMvFlmGRdqfWpit
         CHpyqSpOhceNlg1/qjvOoklrrpYSXoZp5RIFLrcAMoz8oMBRI6RUbAM4byNrqWeAiqmb
         dOltisWRR6JgPYHM6/G6JsILzTBG/KTpznv7cj4l9JmtodDPEwbjDXKa/0rAc29ixBL5
         QU8hqOdfIIR3P9B0e+xqEY8dIpmsp1I9XIyHMsQTqkUBj2RNjQrhVgwxKOi5cNu81Rtn
         v11Q==
X-Gm-Message-State: AOAM533hsstC+5xsKHSoxzcY2yngmnKSbNhJwtA4RlKvFdcTWqtIHJxg
        WWgeXz8SMvO6817Rfp8djCVeZSdhD3M=
X-Google-Smtp-Source: ABdhPJwxN+mLOpBW9HpQKvvgkQYZhYouc0fz5VrQcHXq8Qe2ejq+m05TUiJahpjGBQcwZZRRg2h64g==
X-Received: by 2002:a17:902:8f94:b029:da:d168:4443 with SMTP id z20-20020a1709028f94b02900dad1684443mr25559985plo.57.1608013683019;
        Mon, 14 Dec 2020 22:28:03 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id f15sm20395528pju.49.2020.12.14.22.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 22:28:02 -0800 (PST)
Date:   Mon, 14 Dec 2020 22:27:58 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Jeffrey Lin <jeffrey.lin@raydium.corp-partner.google.com>
Cc:     Furquan Shaikh <furquan@google.com>,
        Sean Paul <seanpaul@chromium.org>, rrangel@chromium.org,
        dan.carpenter@oracle.com, jeffrey.lin@rad-ic.com, KP.li@rad-ic.com,
        calvin.tseng@rad-ic.com, simba.hsu@rad-ic.com,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: raydium_ts_i2c: Do not send zero length
Message-ID: <X9hXbmn1gxxPEKVS@google.com>
References: <1608002466-9263-1-git-send-email-jeffrey.lin@raydium.corp-partner.google.com>
 <X9hONuOdn3cTZ6vH@google.com>
 <CAGdSJX2esa41ypqhGGVSJn+Yqxz8gTyz4HYmfB4WfVDEJLgVYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGdSJX2esa41ypqhGGVSJn+Yqxz8gTyz4HYmfB4WfVDEJLgVYw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Dec 15, 2020 at 02:07:00PM +0800, Jeffrey Lin wrote:
> Yes, it is.

Great!

> 
> Dmitry Torokhov <dmitry.torokhov@gmail.com> 於 2020年12月15日 週二 下午1:48寫道：
> 
> > Hi Jeffrey,
> >
> > On Tue, Dec 15, 2020 at 11:21:06AM +0800, jeffrey.lin wrote:
> > > Add default write command package to prevent i2c quirk error of zero
> > > data length as Raydium touch firmware update is executed.
> > >
> > > Signed-off-by: jeffrey.lin <jeffrey.lin@rad-ic.com>
> > > BUG=b:174207906
> > > TEST=Successfully tested update Raydium touch firmware over 100 times
> > > Change-Id: I311b0d26d7642bb800547cd0e87013be17cb7e1b

Could you please drop these BUG/TEST/Change-Id and re-send from your
main account (jeffrey.lin@rad-ic.com)? Or simply add "From:" tag:

From: Jeffrey Lin <jeffrey.lin@rad-ic.com>

> > > ---
> > >  drivers/input/touchscreen/raydium_i2c_ts.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/input/touchscreen/raydium_i2c_ts.c
> > b/drivers/input/touchscreen/raydium_i2c_ts.c
> > > index 603a948460d64..4d2d22a869773 100644
> > > --- a/drivers/input/touchscreen/raydium_i2c_ts.c
> > > +++ b/drivers/input/touchscreen/raydium_i2c_ts.c
> > > @@ -445,6 +445,7 @@ static int raydium_i2c_write_object(struct
> > i2c_client *client,
> > >                                   enum raydium_bl_ack state)
> > >  {
> > >       int error;
> > > +     static const u8 cmd[] = { 0xFF, 0x39 };
> > >
> > >       error = raydium_i2c_send(client, RM_CMD_BOOT_WRT, data, len);
> > >       if (error) {
> > > @@ -453,7 +454,7 @@ static int raydium_i2c_write_object(struct
> > i2c_client *client,
> > >               return error;
> > >       }
> > >
> > > -     error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, NULL, 0);
> > > +     error = raydium_i2c_send(client, RM_CMD_BOOT_ACK, cmd,
> > sizeof(cmd));
> >
> > Is this supported by all firmwares?
> >
> > >       if (error) {
> > >               dev_err(&client->dev, "Ack obj command failed: %d\n",
> > error);
> > >               return error;
> > > --
> > > 2.26.2
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
> >

Thanks!

-- 
Dmitry
