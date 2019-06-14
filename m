Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE6545069
	for <lists+linux-input@lfdr.de>; Fri, 14 Jun 2019 02:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbfFNAC6 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 13 Jun 2019 20:02:58 -0400
Received: from mail-vs1-f49.google.com ([209.85.217.49]:36932 "EHLO
        mail-vs1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbfFNAC6 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 13 Jun 2019 20:02:58 -0400
Received: by mail-vs1-f49.google.com with SMTP id v6so649418vsq.4
        for <linux-input@vger.kernel.org>; Thu, 13 Jun 2019 17:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=essential-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2opkvVT34hnRoCGzOfcOB0iua9D1z55NI8XzuN4ShgM=;
        b=OX7FQRuA9OTKAXDHa/iNjbvag4WVn74BVkR1IdLp8Mya03h9QUvrCqVmmepOf57FCB
         ZNCkgpJio2iC79WzJdsDWwwTkuzWBDsTADMcf3fIBBYd7hvklVq8eELoLbIhg2bE8cL1
         tQzUWKfGZzARzUqJqedVVm+GBx5WmXDypwNz2KEY9+QGIBq8DQa+NbuQ119rXqnoV7fK
         mnohV+8Lj4oqDevRShmZySexdFGV72DG8sO+Oub3eADBjHDY1HYhvajjvnqanrPx+8u2
         MQpEvpnFF50eGJsWxnJ+6Ge84asphx74QbWD6Rgcn7GZVyVMw6AKnzapXQZv9xwb/i63
         xZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=2opkvVT34hnRoCGzOfcOB0iua9D1z55NI8XzuN4ShgM=;
        b=qjWpYiPc8XDMYHsTkXd54ZpczRsef+FqJDyVr1Mj2tddGWTVLkMo752zVq1cqmpQsM
         mZcVn6drYUvdGdMp3c8PiSLxzkV3czxQbCDwOU3X3RZ4xq4u/3ibdtknQUoPhcF3yw1S
         eTTWDt7zTfwOCBkpp+I3YPMu1ex5Ez5C+W6r3AzdUtIcGkOrp8F28m0lLc8ou9dOPJbZ
         VMm0v9Ygakp1Fwr93gqmyDAkfz3JAZo33kCUbiYcorjt+U8o5tMSLZSg6Zj4i6Jb6Naq
         iwcMJzsqCrZLTocjc7IJZ0TRVMzh3Dzo6d5fMZlWQAj+1btgr5tm3U/s4n8nLnW9NAZa
         WYEg==
X-Gm-Message-State: APjAAAWDFVEY2Kg7czCrGrMyVUazrYrHW8WvhyDbtBg9NnGmdm4MGnBU
        Do4e0cPVXC9bHCds9BNuVkbpyxMzFrdtObxYu0UxkQ==
X-Google-Smtp-Source: APXvYqzeU0eYysnKeFUi8fAY2Jki/miEPQcV78GxVnv0M+odjqOwRO9SNFqOwYI7O49jZkJEBsFwvNYxkP0T0eK/ChA=
X-Received: by 2002:a67:cd14:: with SMTP id u20mr2693863vsl.36.1560470577392;
 Thu, 13 Jun 2019 17:02:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAEXycp+Y-x7N_Yr==Xy_CT5K_a1DZYc85w1OUV+cKC5ZN+KB1g@mail.gmail.com>
In-Reply-To: <CAEXycp+Y-x7N_Yr==Xy_CT5K_a1DZYc85w1OUV+cKC5ZN+KB1g@mail.gmail.com>
From:   =?UTF-8?Q?Jean=2DBaptiste_Th=C3=A9ou?= <jb@essential.com>
Date:   Fri, 14 Jun 2019 09:02:46 +0900
Message-ID: <CAEXycpKJvSsyDQjeCC4YqmtN5tpmO15g8D-_3mrunY-NL1w4Qw@mail.gmail.com>
Subject: Re: Regression post "HID: core: move Usage Page concatenation to Main item"
To:     Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, nsaenzjulienne@suse.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Sorry - Please find the public link:

https://android.googlesource.com/platform/cts/+/master/tests/tests/hardware=
/res/raw/asus_gamepad_register.json

Best regards

On Fri, Jun 14, 2019 at 9:01 AM Jean-Baptiste Th=C3=A9ou <jb@essential.com>=
 wrote:
>
> Hi,
>
> This patch (58e75155009cc800005629955d3482f36a1e0eec) is triggering a
> regression with the following descriptor (report not working as
> expected)
>
> https://partner-android.googlesource.com/platform/cts/+/refs/heads/q-fs-r=
elease/tests/tests/hardware/res/raw/asus_gamepad_register.json
>
> Didn't see anything obviously wrong with this gamepad descriptor, so
> not sure what's trigger the regression.
>
> Thanks a lot
>
> Best regards



--=20
Jean-Baptiste Th=C3=A9ou
Principal System Software Engineer @ Essential
