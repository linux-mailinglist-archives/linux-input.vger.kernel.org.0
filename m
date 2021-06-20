Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2933ADD53
	for <lists+linux-input@lfdr.de>; Sun, 20 Jun 2021 08:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhFTGKa (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 20 Jun 2021 02:10:30 -0400
Received: from mx-lax3-2.ucr.edu ([169.235.156.37]:46344 "EHLO
        mx-lax3-2.ucr.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbhFTGK3 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 20 Jun 2021 02:10:29 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Sun, 20 Jun 2021 02:10:29 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1624169298; x=1655705298;
  h=mime-version:references:in-reply-to:from:date:message-id:
   subject:to:cc;
  bh=ca2COAjHKL7+OCkgt+dQm/iTK6CkVF0mlcxAWJfZ2rg=;
  b=iInZqJIbytEzJf82+61m5JbFihtJyS6KNAH/ouanSOSouFS/w64xjNnm
   Zb8aWHiEovvCZkCGfdKLVef0Mza/0wB8PvMrwiRxq3wP0PR1RazJAM6Jx
   nGKBtkIFq5W/N6UyT2q3tnEj3+E/8bD3eTtwCNXzqN+PAb0z04aERgz2Q
   LEdfnbI0yK91KCvJdnsOg27fn/YASGWhwU0iasjglaUJ/qAuw1Niv8poN
   13FgkriETx4n1qGStrjcuMEYvWqmoVj/bVk9wU1gtaPhbO1hJwzg7N61W
   N0sWq9KhtqYJGttUB9SONtUe1hC6vWG1K8aE2MO95U2ZckZBQJduZ8f6n
   Q==;
IronPort-SDR: JZkaohqGSgVWGfkmIJ9QmpU7jcsBOW0vcud5ouytbuFQqUvJd/+ilApnxnwD/2Z+/kVc7rAbvm
 zzErgvSdHZaFfmlPUME1AafH7dtOAwN5sdm1IeyfzhJnzJoZMqivFVdookdl7h65h72OHQnCpe
 8sS4ny01pfN7Ehtrr1L6qttngvDsNq2tXd1UFhhsPBRVvSahgC4sORGnaHRKe3K6hNW4zPsBiJ
 24ZCP2qIYd7wTiYE3iz6K+F1Hj5hvt3vS+DHnqIwy/83IK5m76KCXt8u9B+PLj/AoWEY+NPC27
 kUQ=
X-IPAS-Result: =?us-ascii?q?A2HXAwBk2c5ggEjYVdFagQmFT2yESJFxikuLQYc7AgkBA?=
 =?us-ascii?q?QEPQQQBAYRQAoJuAiU4EwIEAQEBAQMCAwEBAQEFAQEGAQEBAQEBBQQBAQIQA?=
 =?us-ascii?q?QFuhS9GgjgpAYNtAQEBAxIRVhALCw0CAiYCAiEBEgEFARwGEyKCT4JWAy+ZQ?=
 =?us-ascii?q?YEEPYsygTKBAYdVDUwBCQ2BYhJ+KocJhmEngimBS4I3Nj6CIIU7gmQEhBhua?=
 =?us-ascii?q?YIyAQEBnkScDFoBBgKDBRySF4YMhVsrg16LJ4VvkH4thjWePZFRg0MQI4FIg?=
 =?us-ascii?q?X4zGiV/BmeBS1AZDp0NJC84AgYKAQEDCY00AQE?=
IronPort-PHdr: A9a23:cdAs1RDHjWDOQhD3fqGcUyQUekMY04WdBeb1wqQuh78GSKm/5ZOqZ
 BWZuaw8ygSSA86Csq8MotGVmpioYXYH75eFvSJKW713fDhBt/8rmRc9CtWOE0zxIa2iRSU7G
 MNfSA0tpCnjYgBaF8nkelLdvGC54yIMFRXjLwp1Ifn+FpLPg8it2O2+5pnebx9GiTezYL5+I
 wi6oRjRu8ILnYZsN6E9xwfTrHBVYepW32RoJVySnxb4+Mi9+YNo/jpTtfw86cNOSL32cKskQ
 7NWCjQmKH0169bwtRbfVwuP52ATXXsQnxFVHgXK9hD6XpP2sivnqupw3TSRMMPqQbwoXzmp8
 rxmQwH0higZKzE58XnXis1ug6JdvBKhvAF0z4rNbI2IKPZyYqbRcNUHTmRDQ8lRTTRMDYyyb
 4QND+QPM+VWoZTjqVQStha+GRWgCfnzxjNUmnP736s32PkhHwHc2wwgGsoDv3bVrNT0NKcST
 Oe1x7TLwjXDdfxW2Cr25Y/IcxEgofGDR7NwfdbNxUQhDA7Fk0mfqZb/MzyLy+sNrnGW4ux9X
 u2gl2ApsRt+oiSzxsgykInJgJoYx1/A+Ch9wIs7K8O0RUF/bNCrE5ZduC+XOot4T84+Qmxlp
 Cc3x7MFtJKmYSUG1ZcqygDRZvGIcIWF/xztWfuNLDp+mXlre6q/ig6s/US8zuDwTMq53VZQo
 iZbj9XBt2oB2h7N5sWBV/Bz5F2u2SyV2ADW8uxEJEc0mrfFJJM52b4wk4YTsVzEHi/rhEX6l
 K+WeVsg+uiv8+nnZ6/ppp6YN4NtkgH+MLkiltWxAek6LAQCRWeb+eO71L3s+U32Xq9GgeExk
 qncqJzaJMIbqbClAwJNzIov9xKyAy2l3dkYh3ULMk9JdROdg4XrJV3COPX4Au2+g1Sonjdr3
 ffGPrj5D5TNL3nDkK3ufbdh50JAxgc+1s1f6I5OCr0bPv38R1LxuMTCDhAlKwy03/rnCNJl2
 4MaWGKPBLKZMazLvV+J4OIvO/SMZJMOtTbjJPgq+eTugWU6mVADZ6mp24UYaHSiEvRhOUWZb
 imkvtBUPWILohAvBNDtklqBUTlNLyK+WqMg/CB9FIW8CoTDQZ6Fj7mI3SP9FZpTMDNoEFeJR
 EbpZYWZXL8+aCuTaptwgDwNVOD5EKc83gvouQPnnek0ZtHI8zEV4MqwnON+4PfewFRrrWQcM
 g==
IronPort-HdrOrdr: A9a23:5SS6JKqB625R1KYYMPJ7IqcaV5oQeYIsimQD101hICG9vPbo7v
 xG/c5rrSMc5wxhPU3I9erwWpVoBEmslqKdgrNxAV7BZniDhILAFugLhrcKgQeBJ8SUzJ876U
 4PSdkZNDQyNzVHZATBijVQ3+xO/DBPyszHudvj
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.83,286,1616482800"; 
   d="scan'208";a="49513137"
Received: from mail-pj1-f72.google.com ([209.85.216.72])
  by smtp-lax3-2.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2021 23:01:11 -0700
Received: by mail-pj1-f72.google.com with SMTP id z3-20020a17090a4683b029015f6c19f126so9579455pjf.1
        for <linux-input@vger.kernel.org>; Sat, 19 Jun 2021 23:01:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sbFMlSU8VOH+3s30vncOXVUKJU1McKhQjkr8IIeWaNk=;
        b=kHtGogwQim29BKP4tkgWfClgsXmE4Pma0Wm58OQ4w1idc9PGUTq9RG6yz1vKt/3upv
         WrooYkuIswR4mJFnrpsWE7aRiSA6zRpp+H+mC9n2kdVWi3YMkrWprBKqDjDuo3N6ywne
         NzvMplqrRzf4nAdbAMowTcICRwXKCx06Wp36cTkR9dh+wR7soX7rE4+RI8X4iO12VX3x
         VXxAHqnuAJ06kgsmTb41oEbuftJWuK9RjBUPq1WrfSxZr7fo/qcg3+Owh46udfeEKDxH
         kaZQcFSmt+SOR9sBRmg9l2XVjWeQx3R7I5LD5K79XsnpnwwVY4GzSueCBJs7kv/FkwwW
         4h5w==
X-Gm-Message-State: AOAM530wyDqEU2tryuZc+wi2PUP7Qk7XqM4/rvEkTAf8Z7MKGaFuMfM8
        jVCYPTp9AFsENd9xt4BReeHzDk6vAn0xH6ktVur8NHT5LwgvxSfBeiiV2mwH7/oMKGllufcw8pG
        UdjhkAPDlvxmCEOcfOFiqTYPhf1zB+YmSEI2TDSJr
X-Received: by 2002:a63:805:: with SMTP id 5mr17808118pgi.353.1624168870254;
        Sat, 19 Jun 2021 23:01:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzD9PEuA2dT9jWZUEPhmwSRvJzCmrsGK5wEPE61ZuokJ1CUZk9YPzk0ucz0jUcMkSU2fTyYcxnEWHxpVFbtSI0=
X-Received: by 2002:a63:805:: with SMTP id 5mr17808101pgi.353.1624168869944;
 Sat, 19 Jun 2021 23:01:09 -0700 (PDT)
MIME-Version: 1.0
References: <CABvMjLRxy1yqXUOWqTTeq=UOsLtuPAyOSCi4SPgcbAqjMuWCCg@mail.gmail.com>
 <YM7NzYgEl8NhU36H@google.com> <YM7RkI8fvpkfwAGA@google.com> <YM7ToLeaDajmBiwi@google.com>
In-Reply-To: <YM7ToLeaDajmBiwi@google.com>
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Sat, 19 Jun 2021 23:00:59 -0700
Message-ID: <CABvMjLTP+Vh0cTDLU72Q-64f4DWQAp8-7DZ9GTBtoiqnKsaChA@mail.gmail.com>
Subject: Re: [PATCH] Input: hideep - fix the uninitialized use in hideep_nvm_unlock()
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Anthony Kim <anthony.kim@hideep.com>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dimitry:

Sorry for the inconvenience, I would build the changes next time.
Thanks for your help : )

On Sat, Jun 19, 2021 at 10:35 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> On Sat, Jun 19, 2021 at 10:26:40PM -0700, Dmitry Torokhov wrote:
> > On Sat, Jun 19, 2021 at 10:10:37PM -0700, Dmitry Torokhov wrote:
> > > On Wed, Jun 16, 2021 at 03:48:51PM -0700, Yizhuo Zhai wrote:
> > > > Inside function hideep_nvm_unlock(), variable "unmask_code" could
> > > > be uninitialized if hideep_pgm_r_reg() returns error, however, it
> > > > is used in the later if statement after an "and" operation, which
> > > > is potentially unsafe.
> > >
> > > I think this is pretty sensible, but let's see if the original author
> > > has some comments...
> >
> > I guess not. Oh well...
> >
> > Applied, thank you.
>
> Note that I had to make some changes to make it compile. Please next
> time try building your changes before posting them,
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
