Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D530635E682
	for <lists+linux-input@lfdr.de>; Tue, 13 Apr 2021 20:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347924AbhDMSe4 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Apr 2021 14:34:56 -0400
Received: from smtpcmd12131.aruba.it ([62.149.156.131]:41641 "EHLO
        smtpcmd12131.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347920AbhDMSey (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Apr 2021 14:34:54 -0400
Received: from [192.168.50.29] ([146.241.148.6])
        by Aruba Outgoing Smtp  with ESMTPA
        id WNrqlufXNik8wWNrqlQ05W; Tue, 13 Apr 2021 20:34:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
        t=1618338870; bh=CspUVgxdSBvuBUguzxzfALnyZe40v7DECVkGTOkCOQc=;
        h=Content-Type:From:Mime-Version:Subject:Date:To;
        b=mNG0zmzOKSTpnLQiwfP6Oj7E0zHrmnSbXEXPkg9SpPiPtrFi+zH0l6aMLYIbEnIjN
         sc5LLvTKP8mG9M4gz/4/fBrxwrhxAj1yofDnWBWBthVfzlToEzwNwJGnmMXiuWa+Te
         zI9wxiblS3Kd91goxJcN6VZvkTFjQdUi5R4A/DGwUCS4ea8HfzsCWVPSFuV6YAU6PO
         u+fgbiB/e2fJiyeDJm8NXhNuiYAVNg9d3z2VvJMQ+uw2UAL5aS5KSsLFCKZJAC2mYZ
         mnFsRVFqk9t6Zb8uC+5c87vkuNur3aTmMhFNHW85h6udi+DtVJN+Q8DuJvI0dE2YHW
         USg/l7RiQAAdA==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v6 1/2] dt-bindings: touchscreen: Add HY46XX bindings
Date:   Tue, 13 Apr 2021 20:34:29 +0200
Message-Id: <4B3FA892-C04C-49C7-B306-4105759C7157@benettiengineering.com>
References: <CAL_JsqLZo45pY+mB+vvsAaGaE8N-P=4ojOMGSra4=6y1ESTJBw@mail.gmail.com>
Cc:     Linux Input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Henrik Rydberg <rydberg@bitmath.org>,
        devicetree@vger.kernel.org,
        =?utf-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        linux-kernel@vger.kernel.org
In-Reply-To: <CAL_JsqLZo45pY+mB+vvsAaGaE8N-P=4ojOMGSra4=6y1ESTJBw@mail.gmail.com>
To:     Rob Herring <robh@kernel.org>
X-Mailer: iPhone Mail (18D70)
X-CMAE-Envelope: MS4wfGnaV/O6FR29lYzhROo0xYBVWKV2SBBABAwe7HdHfP8EvfH9RBC9uZKToFhzly0ITNnh7wYtaWGG8BE17YcK5tt/Orn/t4u38EMLvBtNNQoIFIKZD26Z
 m3wxL4pHTssPYSMIE3D4FlPzuNvOQG8K++qU498WT/jh/AW6ACfmzKea8lf4CuY9Q04uaD7Ovul7yL+w9fy4+NIDgPiQ7k18mogwHTz25/opn6UoQn9smdCI
 1NorJgb922VAsmWLFlojJxkRa8izZvjzJMJXmIhA8IV1sZMhWMdXpN1J6+BQ++lcwU/AzQb31fVgTjqQIJ7+Pl2Nq3X9fiI2a7AECj7zaUk6SeKv8jGBBpiI
 xzIdNBJLhovE5Xfh6rOcnqIff2nFT6gZ2FB+4KqXiGH9kAKD0pqmLZSi27OWaSe/OFzaMQPP
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org


> Il giorno 13 apr 2021, alle ore 19:58, Rob Herring <robh@kernel.org> ha sc=
ritto:
>=20
> =EF=BB=BFOn Tue, Apr 13, 2021 at 10:27 AM Giulio Benetti
> <giulio.benetti@benettiengineering.com> wrote:
>>=20
>>> On 4/13/21 5:07 PM, Rob Herring wrote:
>>> On Mon, 12 Apr 2021 17:23:59 +0200, Giulio Benetti wrote:
>>>> This adds device tree bindings for the Hycon HY46XX touchscreen series.=

>>>>=20
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> ---
>>>> V1->V2:
>>>> As suggested by Rob Herring:
>>>> * fixed $id: address
>>>> * added "hycon," in front of every custom property
>>>> * changed all possible property to boolean type
>>>> * removed proximity-sensor-switch property since it's not handled in dr=
iver
>>>> V2->V3:
>>>> As suggested by Jonathan Neusch=C3=A4fer:
>>>> * fixed some typo
>>>> * fixed description indentation
>>>> * improved boolean properties descriptions
>>>> * improved hycon,report-speed description
>>>> V3->V4:
>>>> * fixed binding compatible string in example as suggested by Jonathan N=
eusch=C3=A4fer
>>>> V4->V5:
>>>> As suggested by Rob Herring:
>>>> * drop hycon- prefix from compatible
>>>> * use Hertz unit suffix for hycon,report-speed instead of u32
>>>> * set hycon,report-speed minimum to 1Hz, 0Hz make controller to do noth=
ing
>>>> * change hycon,power-noise-enable property name to hycon,noise-filter-e=
nable
>>>> * improve hycon,filter-data property description
>>>> * use generic touchscreen node name in example
>>>> V5->V6:
>>>> * changed report-speed property name into report-speed-hz according to
>>>> Rob Herring's suggestion
>>>> ---
>>>>  .../input/touchscreen/hycon,hy46xx.yaml       | 119 ++++++++++++++++++=

>>>>  MAINTAINERS                                   |   6 +
>>>>  2 files changed, 125 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/input/touchscreen=
/hycon,hy46xx.yaml
>>>>=20
>>>=20
>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>=20
>> I've sent v7[1] before receiving your Reviewed-by.
>> Do I have to re-submit it once and if I receive a Reviewed-by from you
>> as a v8 with all your Reviewed-by's?
>=20
> I gave it on v7 too, so only if there are other changes on any of the
> patches.

Ah ok, thank you.

> The tools will generally pick up any tags on the version
> applied. You just can't expect maintainers to go rummage thru old
> versions to find any tags.

Sure not, this is the reason why I=E2=80=99ve asked, I=E2=80=99ve forgotten t=
o add some tag to my commits that I usually do, that=E2=80=99s why I=E2=80=99=
ve messed things up.

Thank you again for reviewing and explaining me.
Best regards
Giulio Benetti

>=20
> Rob

