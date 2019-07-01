Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B415B6B2
	for <lists+linux-input@lfdr.de>; Mon,  1 Jul 2019 10:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbfGAIT6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 Jul 2019 04:19:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45235 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGAIT6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 Jul 2019 04:19:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id bi6so6936536plb.12;
        Mon, 01 Jul 2019 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5RAq9uYszW22W7U67V/4aDozO9ynSRPC2gwD5Pz0Hy8=;
        b=U9zpQEOjsvJX//DXmuEHQlEU+zgOiUqln+U1b9OxAfBXMRZ3k77UT9DjKt6cu52zYN
         gEBlv559tlGf3044EoG7nS5WmGjFebc3IlHvcsIb/RXitQ6drGbAGfGctgl3PxXHYmdT
         mMfmI8O7eNp262T61M8a2nM7RWWrsiLchbYReaOusmGe+EswBNPY9J7j2y1Vb6/ng9gs
         BEOSzIoJKGtDX9QQQfQ0BowezkhyGBxcX++pngTnnGcqoQ0m0RUQXHw47NgXQF+v/Ye3
         z5RFFjY5FsiMon6d3BC6NThvKzt1RmlbT9vYTajQh8TCdyXCBzPdbP+xk5faCr1IzL0z
         Ji+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5RAq9uYszW22W7U67V/4aDozO9ynSRPC2gwD5Pz0Hy8=;
        b=GwayWtz3OBgK31pobmI11F2gUkjGHiZ+IVsq37ltajtyyLl9yjMotdTXaAiEWHAmIf
         ESwLQE1xrvj1MaxbkWYizVn0OWcIP+FiK+2fGKhSmCO3KhJH2LOPHzXevp05Pxh7AsVJ
         FqwqBM8m9nwFIxCnACPRwPr7EKsVnNrls0w8LYU8h2tBhynP8Tn5fBAdIJpaDHW08ES9
         MaXSvau+83k2xCWXpp2qDeSG2D3NM4iGWCiGz8QYCH3iHqSEn3ybJmNnkrWbvTzbdXuC
         ApcbfPMsI7xhRkj/9SlVH7GKOeEHlEN5zryp0eRVPTe6H/5QNmN/1lvROO34ypuNMlXc
         7eDw==
X-Gm-Message-State: APjAAAWWphiefuHVz0QjEjyX4uFZyi5qVr0qmQ1u2/PFPhCXZXXlH57T
        zlfkjTkV0cU8JRWu76Y/ikg=
X-Google-Smtp-Source: APXvYqym92cXfSAWMcsu160Ed9dT8cm0pCmt2LCJ9Ax1e9Aj6FS68f3xj7aWhLOKmTX+Qipt4e+tPA==
X-Received: by 2002:a17:902:d20a:: with SMTP id t10mr26960233ply.52.1561969197422;
        Mon, 01 Jul 2019 01:19:57 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id x26sm11504811pfq.69.2019.07.01.01.19.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 01 Jul 2019 01:19:56 -0700 (PDT)
Date:   Mon, 1 Jul 2019 01:19:55 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Huckleberry <nhuck@google.com>, nick@shmanahar.org,
        linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH v2] Input: atmel_mxt_ts - fix -Wunused-const-variable
Message-ID: <20190701081955.GF172968@dtor-ws>
References: <CAKwvOdnjTxzXgPHQcC7K8N5YkTvh66sy86oorPJZc07b7UBhGw@mail.gmail.com>
 <20190613182326.237391-1-nhuck@google.com>
 <CAKwvOd=252Ak-VQ20XtsGaRXEfraxtNTNjhjYfdrsWv_7OHsoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=252Ak-VQ20XtsGaRXEfraxtNTNjhjYfdrsWv_7OHsoQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, Jun 13, 2019 at 11:26:41AM -0700, Nick Desaulniers wrote:
> On Thu, Jun 13, 2019 at 11:24 AM 'Nathan Huckleberry' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> > Changes from v1 -> v2
> > * Moved definition of mxt_video_fops into existing ifdef
> 
> Thanks for the v2.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Applied, thank you.

> 
> > --- a/drivers/input/touchscreen/atmel_mxt_ts.c
> > +++ b/drivers/input/touchscreen/atmel_mxt_ts.c
> > @@ -256,16 +256,6 @@ enum v4l_dbg_inputs {
> >         MXT_V4L_INPUT_MAX,
> >  };
> >
> > -static const struct v4l2_file_operations mxt_video_fops = {
> > -       .owner = THIS_MODULE,
> > -       .open = v4l2_fh_open,
> > -       .release = vb2_fop_release,
> > -       .unlocked_ioctl = video_ioctl2,
> > -       .read = vb2_fop_read,
> > -       .mmap = vb2_fop_mmap,
> > -       .poll = vb2_fop_poll,
> > -};
> > -
> >  enum mxt_suspend_mode {
> >         MXT_SUSPEND_DEEP_SLEEP  = 0,
> >         MXT_SUSPEND_T9_CTRL     = 1,
> > @@ -2218,6 +2208,16 @@ static int mxt_init_t7_power_cfg(struct mxt_data *data)
> >  }
> >
> >  #ifdef CONFIG_TOUCHSCREEN_ATMEL_MXT_T37
> > +static const struct v4l2_file_operations mxt_video_fops = {
> > +       .owner = THIS_MODULE,
> > +       .open = v4l2_fh_open,
> > +       .release = vb2_fop_release,
> > +       .unlocked_ioctl = video_ioctl2,
> > +       .read = vb2_fop_read,
> > +       .mmap = vb2_fop_mmap,
> > +       .poll = vb2_fop_poll,
> > +};
> > +
> 
> -- 
> Thanks,
> ~Nick Desaulniers

-- 
Dmitry
