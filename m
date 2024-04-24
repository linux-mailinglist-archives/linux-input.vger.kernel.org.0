Return-Path: <linux-input+bounces-3239-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F9B8B07C4
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 12:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987411C22E7A
	for <lists+linux-input@lfdr.de>; Wed, 24 Apr 2024 10:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786F01598EC;
	Wed, 24 Apr 2024 10:55:46 +0000 (UTC)
X-Original-To: linux-input@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FEF1598F9;
	Wed, 24 Apr 2024 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713956146; cv=none; b=AVp3iDGQnyqSilAsDLNYkzRtbtTv9oUHI/UpUi8eBTjkt6ECZaVRBDUE0j3Xg+iCt4JS9oEKC4pF2CgVjaVK/lrNRtteSVnYeEvisi2T/hiALiMOXGg0zHoaDJc0d7YMp5FOZqCbr419FfdnCs97m6O30ZFswdn1WGwDATz+pVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713956146; c=relaxed/simple;
	bh=Cj6K2pDKfACVdriDTBYVm1W83EbsVbS9eJGxYbfANjE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EwQfJNula+OtpxRLSmj7lBTqxiM79i6VPMKKPdq8vpEIx4F/lJ//2ARhQyT0jmUVVWchWptCMVnNPf54iXBKkQ2iyyBEpWCP3cHnz7Ty4d82puahVmgaHMtgN7jXKjlSUx8pCeXp1yISSRWbarxWLnH75V6PEcFt3d5gx+6YL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5CF49339;
	Wed, 24 Apr 2024 03:56:11 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E20A93F73F;
	Wed, 24 Apr 2024 03:55:41 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:55:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, James
 McGregor <jamcgregor@protonmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: sun4i-lradc-keys: Add H616
 compatible
Message-ID: <20240424115539.50efd2f0@donnerap.manchester.arm.com>
In-Reply-To: <1714205b-39cf-4803-b251-a35f6b9ab3e9@linaro.org>
References: <20240422164511.2488261-1-andre.przywara@arm.com>
 <20240422164511.2488261-2-andre.przywara@arm.com>
 <20240423111502.6e068887@donnerap.manchester.arm.com>
 <f2021c5d-25fa-4bdf-8f8c-b0bc271eb54e@linaro.org>
 <20240423135106.02ab4473@donnerap.manchester.arm.com>
 <1714205b-39cf-4803-b251-a35f6b9ab3e9@linaro.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 23 Apr 2024 16:59:31 +0200
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

Hi,

> On 23/04/2024 14:51, Andre Przywara wrote:
> > On Tue, 23 Apr 2024 14:18:23 +0200
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > 
> > Hi,
> >   
> >> On 23/04/2024 12:15, Andre Przywara wrote:  
> >>> On Mon, 22 Apr 2024 17:45:10 +0100
> >>> Andre Przywara <andre.przywara@arm.com> wrote:
> >>>
> >>> Hi,
> >>>     
> >>>> From: James McGregor <jamcgregor@protonmail.com>
> >>>>
> >>>> The Allwinner H616 SoC has an LRADC which is compatible with the
> >>>> versions in existing SoCs.
> >>>> Add a compatible string for H616, with the R329 fallback. This is the
> >>>> same as the D1, so put them into an enum.
> >>>>
> >>>> Signed-off-by: James McGregor <jamcgregor@protonmail.com>
> >>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>    
> >>>
> >>> Compared the descriptions in the manual between the R392 and the H616, they
> >>> look the same:
> >>>
> >>> Reviewed-by: Andre Przywara <andre.przywara@arm.com>    
> >>
> >> Why do you review your own patches? Does it mean that you contribute
> >> code which you did not review before?  
> > 
> > I just merely sent the code on behalf of James, because he had trouble
> > with the email setup (Protonmail has no SMTP), but didn't want to delay
> > the post any longer.  
> 
> OK, thanks, I suggest using b4 relay in the future.

Sure, will relay that - though this is not trivial to setup either.

> >> This is odd process.  
> > 
> > I agree, I would have liked it more if James would have sent it himself,
> > and then my review would look more natural, but with my review I
> > wanted to explicitly point out the technical correctness. Besides: I found
> > this ordering issue in the other patch only after sending, so needed to
> > somehow respond anyway.
> > Also I wanted to make the process transparent: someone posts a patch (in
> > this case via a proxy), then it gets reviewed.
> >   
> >> Your Review is implied by sending the patch.  
> > 
> > Is that really true? I was under the impression that sending is  
> 
> For authorship, both tested and review are implied. You cannot send code
> which you do not think is correct, therefore your authorship fulfills
> entire Reviewer's statement of oversight. There is nothing new said in
> statement of oversight comparing to what authorship says.

Fair enough, and James did, but I am not the author, as shown by the
explicit From: line, having a different name.
I *did* have a look over the patch before sending it, running checkpatch
etc.

But I cannot find anything in submitting-patches.rst that would constitute
that Signed-off-by: includes any kind of technical review, it just seems
to cover the legal aspects of patch deliverance?

And personally for me a *review* means a thorough look at the code,
understanding what it does and how it does it, and checking various
details, for instance by looking into a datasheet.
This is what I did only later, hence the separate review mail.

> Now for testing, I think it is also kind of obvious that whenever we can
> test our own code, we test it.

Granted. I do not have hardware to test, but I ran DT schema checks
before sending, I guess this qualifies as "testing" to some degree.

> For sending other people patches, we could disagree. I stand that I
> would not ever send incorrect patch intentionally.

Sure, and the patch was not incorrect, I trust James that far, because I
know him and talked to him about this patch and the process before.

> Therefore reviewer's statement of oversight is entirely redundant as well.

Maybe I missed that, but I don't see anything in the documentation that
would support this statement. The "reviewer's statement of oversight"
is only expressed by an explicit Reviewed-by: tag, it seems, and none of
the other tags seem to include that. I would agree that authorship does,
somewhat naturally, but I don't see that sending or SoB does.

> I just cannot send
> someone's patch without reviewing, thus without adhering to points
> expressed by statement of oversight.

As you mention elsewhere, this seems to be individual.
I personally feel that this assumed "implicit review", given through
the SoB tag or through sending, is weaker than an explicit Rb tag. I agree
that by sending a patch from someone else I take some kind of
responsibility for the patch, but in this case I wanted to express
that I did a proper review of the patch, going beyond the usual process
checks. Hence the reply with the R-b tag.

> > independent from review. I mean I doubt that every maintainer sending
> > patches up the chain (when they add their SoB) implies a *review*? Surely  
> 
> Yes, every. This applies to mass-maintainers, like netdev, Greg, Andrew etc.
> 
> Every patch I apply to my subsystems is reviewed by me. I cannot do
> else, because that is the requirement of maintainership.

I don't see it that way, I guess many maintainers rely on (thorough)
reviews from third parties, and just glance over each patch before
sending? Doesn't mean that they can and do reviews, but I feel it's not a
requirement to do so *yourself* for *every* patch?

> There are however maintainers (see i2c patches or Intel DRM) who accept
> patches and do not review them. When they review, they provide
> additional Rb tag + Sob. This is weird because it means when they accept
> patch, they take it unreviewed! Their SoB does not imply reviewing patch
> and this is in contrast to kernel process.
> 
> BTW, Stephen Rothwell mentions this to every maintainer on adding their
> tree to linux-next ("You will need to ensure that ... reviewed by you
> (or another maintainer of your subsystem tree)").

But this hints that there must be *some* review taking place, and it's the
maintainer's responsibility to ensure this. But that doesn't mean that the
maintainer cannot delegate? And then they would just forward patches
reviewed by trusted people.

> > they do agree on the patch (also typically expressed by an Ack), otherwise
> > they wouldn't send it, but a "review" is still a different thing.  
> 
> IMO, this would mean such maintainers accept code which they do not
> understand/review/care. They are just patch juggling monkeys who take
> something and push it further without doing actual work.
> 
> That's not how maintainership should look like. Maintainer must take
> reviewed code and, if other maintainers do not review, then they must
> perform it.

Of course, but I feel this discussion goes into a different direction. I am
not a maintainer for the sunxi tree, I am a mere messenger here,
forwarding a patch. And I didn't think this implies an implicit review.
A did an explicit one, to stress that I did look into the patch more
thoroughly, and also because we are not exactly drowning in reviewers ;-)

> > The Linux history has both Rb + SoB from the same person and just SoB
> > signatures, so I assume that it's not implied.  
> 
> It depends on people. As I said, I2C and DRM provide Review tag. For me
> this is silly and suggest that all my work, that 1000 patches I took,
> was not reviewed.

If you forward a thousand patches, I wouldn't expect you did review all of
them *yourself*. This would be an almost impossible task, unless "review"
just means something like: "uses tabs for indentation".

> >> And you have there SoB which indicates you sent it...  
> > 
> > Yes, but SoB just means I sign off on the legal aspects: that I got the
> > patches legally, compliant with the GPL, and that I am fine with and
> > allowed to release them under GPL conditions.
> > That does not include any code review aspect, AFAICT.  
> 
> So you want to say, that you are fine in sending intentionally buggy
> code, knowingly incorrect, because your SoB and your "git send-email"
> does not mean you reviewed it?

Where did I claim that? Of course I would not send intentionally buggy
code, and of course I did some high level checking of the patch before I
attached my name to it. But to me this is still different from a proper
"review", hence my reply.

Cheers,
Andre


> Best regards,
> Krzysztof
> 
> 


