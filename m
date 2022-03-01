Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FD04C8464
	for <lists+linux-input@lfdr.de>; Tue,  1 Mar 2022 07:55:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229964AbiCAG4F (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 1 Mar 2022 01:56:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiCAG4E (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 1 Mar 2022 01:56:04 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920F975C12
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 22:55:24 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id bx9-20020a17090af48900b001bc64ee7d3cso1391983pjb.4
        for <linux-input@vger.kernel.org>; Mon, 28 Feb 2022 22:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SIWZ6lP/ClbV+wOmiEFLrUEgznXCx3rCbbDw/d2ceb4=;
        b=cGyR4Gtl9EZ1OXpAMU2h3KLj3Zg912Pxi/Y4P8+XLLCE0dkA1rt+TXzSVEXm4juY/k
         dqlYLY7RE/n9Pr0XNUDA5nLkOJ26ja+ja7vc2UGlievaCNql2v3tiBALHCY71IBaWQS2
         6RFVKi9imlwRy1Wqp9WF/hKTVrYnmQxhyaE+E1M1O9F/Kdw994jnyhCNJWLxm7/R1gnY
         47YpHCgPnz4I+hT1Jd9/lpXfHXog8ooLcWFhzsQkTgR0g3wU4hmum0X0XFm0BMUReKl3
         Lmvm3rFcjN5tXvFstgGFi5vGbU22ixmDZ4EaYudxyDOSYjFxvpisVRP7C9Mba8a57hlS
         t2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SIWZ6lP/ClbV+wOmiEFLrUEgznXCx3rCbbDw/d2ceb4=;
        b=Hd1o8EkRDeCp27fFeiynUyr5rsTy4/kL0oarH/A121j/oz6WHaTIjQ7kVfMo/gFjFA
         9btCNj1neY1Lo/YwKKx9rSbPUtDlJFvrDR/+3NKE5OpMOAPKQRqk69PWX1k+rvCK18Bh
         +wGzbvWt1NcNetG7+GkMec/03UrKbou/xTzisTe/J1oXhUY+F1BR8tIUDOOsUtOJgBWc
         8EFhmrwTVHtjE6vFYOr42bkJWgotqr82aY+llO9vcieUDbwiIdNxuVf8uer/+/1F7R6+
         y3426hJFpOcBcDSRGPFxCaSVhhFp2+xxvCfG85jlJX/boTlVYTNdO1qd9dknv5DmNI4t
         W2QA==
X-Gm-Message-State: AOAM531YX9dre+GHZ9gRoMtizedOheIUcGivNrXMK/OqsBVHLgP/EcY6
        I5y8fADOMOEWts2cnjIyghs=
X-Google-Smtp-Source: ABdhPJxSPyRew7+qgAzsr6kCOTCBtgrzTVCgIBWLZ77fCHnsPGoyRwjVYgHu4z8qkpEpgQBR/vWpKQ==
X-Received: by 2002:a17:90b:fd4:b0:1bc:1bf2:6fc9 with SMTP id gd20-20020a17090b0fd400b001bc1bf26fc9mr20387265pjb.97.1646117723893;
        Mon, 28 Feb 2022 22:55:23 -0800 (PST)
Received: from google.com ([2620:15c:202:201:c174:264:5e49:f2cb])
        by smtp.gmail.com with ESMTPSA id mu1-20020a17090b388100b001bedddf2000sm742641pjb.14.2022.02.28.22.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 22:55:22 -0800 (PST)
Date:   Mon, 28 Feb 2022 22:55:20 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-input@vger.kernel.org,
        Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
        benjamin.tissoires@redhat.com, Jiri Kosina <jikos@kernel.org>,
        Sean O'Brien <seobrien@chromium.org>,
        "Douglas Anderson linux-kernel @ vger . kernel . org" 
        <dianders@chromium.org>, Jiri Kosina <jkosina@suse.cz>
Subject: Re: [PATCH v5 5/5] HID: google: modify HID device groups of eel
Message-ID: <Yh3DWP3Nyk2XcidE@google.com>
References: <20220228075446.466016-1-dmitry.torokhov@gmail.com>
 <20220228075446.466016-6-dmitry.torokhov@gmail.com>
 <CAE-0n50nS_y740FWAJZF5q_NtawoFeDqE1C-ENLKBaCYmMfiJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50nS_y740FWAJZF5q_NtawoFeDqE1C-ENLKBaCYmMfiJA@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, Feb 28, 2022 at 12:57:56PM -0800, Stephen Boyd wrote:
> Quoting Dmitry Torokhov (2022-02-27 23:54:46)
> > From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> >
> > If HID_GROUP of eel is set to HID_GROUP_GENERIC, Whiskers Tablet Mode
> > Switch of eel hammer will not be detected by system because the
> > hid-vivaldi driver probes the device. When it is set to
> > HID_GROUP_VIVALDI, system will detect Whiskers Tablet Mode Switch
> > successfully and also support the vivaldi keyboard layout.
> >
> > Tested-by: "Sean O'Brien" <seobrien@chromium.org>
> > Acked-by: Jiri Kosina <jkosina@suse.cz>
> > Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
> > [swboyd@chromium.org: Expand on commit text]
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > Link: https://lore.kernel.org/r/20220216195901.1326924-5-swboyd@chromium.org
> > Patchwork-Id: 12748989
> 
> Should this patchwork id be removed?

Yeah, this is leftover from my scripts, they will drop it when applying.

Thanks.

-- 
Dmitry
