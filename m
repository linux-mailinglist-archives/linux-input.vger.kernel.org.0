Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB82146C41
	for <lists+linux-input@lfdr.de>; Sat, 15 Jun 2019 00:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725942AbfFNWTD (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 14 Jun 2019 18:19:03 -0400
Received: from resqmta-ch2-01v.sys.comcast.net ([69.252.207.33]:47726 "EHLO
        resqmta-ch2-01v.sys.comcast.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725922AbfFNWTD (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Fri, 14 Jun 2019 18:19:03 -0400
Received: from resomta-ch2-04v.sys.comcast.net ([69.252.207.100])
        by resqmta-ch2-01v.sys.comcast.net with ESMTP
        id buK4h7Abrx8pXbuPOhyAym; Fri, 14 Jun 2019 22:10:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=comcastmailservice.net; s=20180828_2048; t=1560550254;
        bh=By1+KwAQDvxknCnYhgfG8EQ2r/nPs2JRxqJbokVnKho=;
        h=Received:Received:From:Subject:Reply-To:To:Message-ID:Date:
         MIME-Version:Content-Type;
        b=j6oNCQQBioSersuLeCW7QT3KSw6TdqqWY3MYEh1rC7qQkToh9otjmOlQfL/vffDzk
         M9KZR9Ee467GErsK06TP321W2f8HwXmu8zoRE0wTiQ4sM62cG3D7PjasWLOxXT49pz
         eH+EnHx4XnwRJLS0WAh7rpvaqvorflFbbnkQiHECecedZytmNdPx2MBS419x52RvSr
         70mZuc5Z8CvnmtKGzPdA4Kd9X3wZbubKp0U9sgY4MeMvDTlan970acMH/DoCrAJ3Bq
         ZWBa3RF5rGW7SSHX7rmWEkfMnwDbrNJ3pWEaRbULBm+NuMjxxzUggYN+c6Q/nFyCTB
         Yc03lokAFZctA==
Received: from [IPv6:2001:558:6040:22:2171:426f:b27e:296d] ([IPv6:2001:558:6040:22:2171:426f:b27e:296d])
        by resomta-ch2-04v.sys.comcast.net with ESMTPSA
        id buPMhbDdCXrm0buPNhURJ8; Fri, 14 Jun 2019 22:10:53 +0000
X-Xfinity-VMeta: sc=-100;st=legit
From:   James Feeney <james@nurealm.net>
Subject: Re: [PATCH 1/2] HID: input: make sure the wheel high resolution
 multiplier is set
Reply-To: james@nurealm.net
To:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        Sasha Levin <sashal@kernel.org>, Jiri Kosina <jikos@kernel.org>
References: <20190423154615.18257-1-benjamin.tissoires@redhat.com>
 <CAO-hwJLCL95pAzO9kco2jo2_uCV2=3f5OEf=P=AoB9EpEjFTAw@mail.gmail.com>
 <43a56e9b-6e44-76b7-efff-fa8996183fbc@nurealm.net>
 <CAO-hwJK614pzseUsGqH65fCnrm=N7970i4_mqi0m1gdkY=J0ag@mail.gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Message-ID: <b6410e5d-b165-7a9b-2ef5-eb44c8de7753@nurealm.net>
Date:   Fri, 14 Jun 2019 16:09:35 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAO-hwJK614pzseUsGqH65fCnrm=N7970i4_mqi0m1gdkY=J0ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hey Everyone

On 4/24/19 10:41 AM, Benjamin Tissoires wrote:
>>> For a patch to be picked up by stable, it first needs to go in Linus'
>>> tree. Currently we are working on 5.1, so any stable patches need to
>>> go in 5.1 first. Then, once they hit Linus' tree, the stable team will
>>> pick them and backport them in the appropriate stable tree.

Hmm - so, I just booted linux 5.1.9, and this patch set is *still* missing from the kernel.

Is there anything that we can do about this?

James
